// core/network/dio_provider.dart
import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// refresh 호출용
import 'package:seasonthon_team_25_fe/feature/auth/data/datasources/remote/auth_api.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/models/auth_models.dart';

/// ===============================
/// SecureStorage & Token Keys
/// ===============================
final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());

const _kAccess = 'accessToken';
const _kRefresh = 'refreshToken';
const _kType = 'tokenType';
const _kExpiresIn = 'expiresIn';

/// ===============================
/// BaseOptions
/// ===============================
BaseOptions _baseOptions() => BaseOptions(
  baseUrl: const String.fromEnvironment(
    'API_BASE_URL',
    defaultValue:
        'https://financial-freedom-g6gedpdhhah5afdm.koreacentral-01.azurewebsites.net',
  ),
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
);

/// ===============================
/// Logger (디버그용)
/// ===============================
class SimpleLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      '[REQ] ${options.method} ${options.uri}\n'
      'Headers: ${options.headers}\n'
      'Data: ${options.data}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      '[RES] ${response.statusCode} ${response.requestOptions.uri}\n'
      'Data: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      '[ERR] ${err.requestOptions.method} ${err.requestOptions.uri}\n'
      'Type: ${err.type}\n'
      'Message: ${err.message}\n'
      'Data: ${err.response?.data}',
    );
    super.onError(err, handler);
  }
}

/// ===============================
/// Refresh 전용 Dio/AuthApi (인터셉터 없음)
/// ===============================
final _baseDioOptionsProvider = Provider<BaseOptions>((_) => _baseOptions());

final refreshDioProvider = Provider<Dio>((ref) {
  return Dio(ref.watch(_baseDioOptionsProvider));
});

final refreshApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(refreshDioProvider);
  return AuthApi(dio);
});

/// ===============================
/// 메인 Dio: Authorization 주입 + 401 Refresh + 원요청 재시도
/// ===============================
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(ref.watch(_baseDioOptionsProvider));

  final storage = ref.watch(secureStorageProvider);
  final refreshApi = ref.watch(refreshApiProvider);

  // 동시 401 대응: refresh를 1회만 수행하기 위한 락
  Future<bool>? refreshing;

  bool shouldSkip(RequestOptions o) {
    final p = o.path;
    // 로그인/가입/리프레시 엔드포인트는 Authorization 헤더를 붙이지 않고,
    // 401이어도 refresh 로직을 태우지 않습니다.
    return p.contains('/api/auth/login') ||
        p.contains('/api/auth/sign-up') ||
        p.contains('/api/auth/refresh');
  }

  dio.interceptors.add(
    QueuedInterceptorsWrapper(
      // 1) Request: Authorization 헤더 주입
      onRequest: (options, handler) async {
        if (!shouldSkip(options)) {
          final at = await storage.read(key: _kAccess);
          final tt = await storage.read(key: _kType);
          if (at != null && at.isNotEmpty) {
            options.headers['Authorization'] = '${tt ?? 'Bearer'} $at';
          }
        } else {
          // 안전 차원: 스킵 대상은 Authorization 제거
          options.headers.remove('Authorization');
        }
        handler.next(options);
      },

      // 2) Error: 401 → refresh → 원요청 재시도
      onError: (error, handler) async {
        final status = error.response?.statusCode ?? 0;
        final req = error.requestOptions;

        // 401이 아니거나, 스킵 대상(로그인/가입/리프레시)이면 그냥 통과
        if (status != 401 || shouldSkip(req)) {
          return handler.next(error);
        }

        // refresh 토큰 확인
        final rt = await storage.read(key: _kRefresh);
        if (rt == null || rt.isEmpty) {
          return handler.next(error);
        }

        // 중복 refresh 방지
        refreshing ??= () async {
          try {
            final res = await refreshApi.refresh(
              RefreshRequest(refreshToken: rt),
            );

            // 새 토큰 저장
            await storage.write(key: _kAccess, value: res.accessToken);
            await storage.write(key: _kRefresh, value: res.refreshToken);
            await storage.write(key: _kType, value: res.tokenType);
            await storage.write(
              key: _kExpiresIn,
              value: res.expiresIn.toString(),
            );
            return true;
          } catch (_) {
            // refresh 실패 → 토큰 삭제
            await storage.delete(key: _kAccess);
            await storage.delete(key: _kRefresh);
            await storage.delete(key: _kType);
            await storage.delete(key: _kExpiresIn);
            return false;
          } finally {
            // 잠깐 지연 후 락 해제(연쇄 요청 안전하게)
            await Future<void>.delayed(const Duration(milliseconds: 10));
            refreshing = null;
          }
        }();

        final ok = await refreshing!;
        if (!ok) return handler.next(error);

        // 원 요청 재시도 (새 Access Token 반영)
        final newAt = await storage.read(key: _kAccess);
        final newTt = await storage.read(key: _kType);
        final opts = Options(
          method: req.method,
          headers: {
            // 원래의 헤더 중 Authorization은 새 토큰으로 대체
            ...req.headers..remove('Authorization'),
            if (newAt != null && newAt.isNotEmpty)
              'Authorization': '${newTt ?? 'Bearer'} $newAt',
          },
          responseType: req.responseType,
          contentType: req.contentType,
          followRedirects: req.followRedirects,
          validateStatus: req.validateStatus,
          receiveDataWhenStatusError: req.receiveDataWhenStatusError,
          extra: req.extra,
        );

        try {
          final clone = await dio.request<dynamic>(
            req.path,
            data: req.data,
            queryParameters: req.queryParameters,
            options: opts,
          );
          return handler.resolve(clone);
        } catch (_) {
          return handler.next(error);
        }
      },
    ),
  );

  // 마지막에 로거 추가(재시도 후 응답도 로깅됨)
  dio.interceptors.add(SimpleLogInterceptor());

  return dio;
});
