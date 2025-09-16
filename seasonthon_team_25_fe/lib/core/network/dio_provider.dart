import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/core/router/app_router.dart';
import 'package:seasonthon_team_25_fe/utils/toasts.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';

abstract class TokenStorage {
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String? tokenType,
    int? expiresIn,
  });
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearTokens();
}

// 웹 - 쿠키를 사용
class WebTokenStorage implements TokenStorage {
  String _cookieAttrs({int? maxAge}) {
    final attrs = <String>[
      'path=/',
      if (maxAge != null) 'max-age=$maxAge',
      // 개발 http라면 secure 빼도 되지만, 실서비스 https면 secure 권장
      if (html.window.location.protocol == 'https:') 'secure',
      'samesite=lax',
    ];
    return attrs.join('; ');
  }

  String? _readCookie(String name) {
    final c = html.document.cookie;
    if (c == null) return null;
    final m = RegExp('(?:^|;\\s*)${RegExp.escape(name)}=([^;]*)').firstMatch(c);
    return m?.group(1);
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String? tokenType,
    int? expiresIn,
  }) async {
    final attrsAccess = _cookieAttrs(maxAge: expiresIn ?? 1800);
    final attrsRefresh = _cookieAttrs(maxAge: 60 * 60 * 24 * 14); // 14days 예시
    html.document.cookie = 'accessToken=$accessToken; $attrsAccess';
    html.document.cookie = 'refreshToken=$refreshToken; $attrsRefresh';
  }

  @override
  Future<String?> getAccessToken() async => _readCookie('accessToken');

  @override
  Future<String?> getRefreshToken() async => _readCookie('refreshToken');

  @override
  Future<void> clearTokens() async {
    html.document.cookie =
        'accessToken=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/;';
    html.document.cookie =
        'refreshToken=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/;';
  }
}

// 모바일 - flutter_secure_storage를 사용
class MobileTokenStorage implements TokenStorage {
  final _storage = const FlutterSecureStorage();
  static const _kAccess = 'accessToken';
  static const _kRefresh = 'refreshToken';
  static const _kExpiresAt = 'accessToken.expiresAt';

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    String? tokenType,
    int? expiresIn,
  }) async {
    await _storage.write(key: _kAccess, value: accessToken);
    await _storage.write(key: _kRefresh, value: refreshToken);
    if (expiresIn != null) {
      final expiresAt = DateTime.now()
          .add(Duration(seconds: expiresIn))
          .millisecondsSinceEpoch
          .toString();
      await _storage.write(key: _kExpiresAt, value: expiresAt);
    }
  }

  @override
  Future<String?> getAccessToken() => _storage.read(key: _kAccess);

  @override
  Future<String?> getRefreshToken() => _storage.read(key: _kRefresh);

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: _kAccess);
    await _storage.delete(key: _kRefresh);
    await _storage.delete(key: _kExpiresAt);
  }
}

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return kIsWeb ? WebTokenStorage() : MobileTokenStorage();
});

// Dio 기본 설정 및 로거 인터셉터
BaseOptions _baseOptions() => BaseOptions(
  baseUrl: 'http://34.47.69.71',
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
);

class SimpleLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('[REQ] ${options.method} ${options.uri}\nData: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final path = response.requestOptions.path;
    final isTokenEndpoint =
        path.contains('/login') || path.contains('/refresh');
    final safeData = isTokenEndpoint ? '<redacted>' : '${response.data}';
    log(
      '[RES] ${response.statusCode} ${response.requestOptions.uri}\nData: $safeData',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      '[ERR] ${err.requestOptions.uri}\nMessage: ${err.message}\nData: ${err.response?.data}',
    );
    super.onError(err, handler);
  }
}

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(_baseOptions());
  // 플랫폼에 맞는 토큰 저장소 주입
  final tokenStorage = ref.watch(tokenStorageProvider);
  final goRouter = ref.watch(routerProvider);

  // 동시 401 에러 대응: 락(lock)을 이용해 refresh 요청이 중복되지 않도록 합니다.
  Future<String?>? refreshingToken;

  bool shouldSkip(RequestOptions options) {
    // 인증 헤더를 제외할 경로를 정의합니다.
    final path = options.path;
    return path.contains('/sign-up') ||
        path.contains('/login') ||
        path.contains('/refresh');
  }

  dio.interceptors.add(
    // 요청을 큐에 넣어 순서대로 처리
    QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        // 인증이 필요 없는 경로인지 확인
        if (shouldSkip(options)) {
          return handler.next(options);
        }

        final accessToken = await tokenStorage.getAccessToken();
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        final statusCode = error.response?.statusCode;
        final requestOptions = error.requestOptions;

        // 401 오류가 아니거나, 토큰이 필요 없는 경로면 토스트를 띄우고 다음으로 이동
        if (statusCode != 401 || shouldSkip(requestOptions)) {
          final errorMessage = mapDioError(error);
          log('User-friendly error: $errorMessage');
          ToastUtils.showErrorToast(null, errorMessage);
          return handler.next(error);
        }

        final refreshToken = await tokenStorage.getRefreshToken();
        if (refreshToken == null) {
          await tokenStorage.clearTokens();
          // 회원 가입 페이지로 이동
          goRouter.go('/sign-up');
          return handler.next(error);
        }

        // 락이 걸려 있으면(다른 요청이 이미 토큰 갱신을 시작한 상황) 해제될 때까지 대기
        if (refreshingToken != null) {
          await refreshingToken;
          return handler.resolve(await dio.fetch(requestOptions));
        }

        // 리프레시 토큰 요청 시작
        final completer = Completer<String?>();
        refreshingToken = completer.future;

        try {
          // 리프레시 요청을 보냅니다.
          final response = await dio.post(
            '/api/auth/refresh',
            data: {'refreshToken': refreshToken},
            options: Options(
              headers: {'Authorization': 'Bearer $refreshToken'},
            ),
          );

          final newAccessToken = response.data['accessToken'];
          final newRefreshToken = response.data['refreshToken'];
          final newTokenType = response.data['tokenType'] as String?;
          final newExpiresIn = response.data['expiresIn'] as int?;

          // 새로운 토큰 저장
          await tokenStorage.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
            tokenType: newTokenType,
            expiresIn: newExpiresIn,
          );

          completer.complete(newAccessToken);

          // 원래 요청을 새 토큰으로 다시 시도
          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          return handler.resolve(await dio.fetch(requestOptions));
        } on DioException catch (e) {
          completer.complete(null);
          await tokenStorage.clearTokens();
          // 회원 가입 페이지로 이동
          goRouter.go('/sign-up');
          return handler.next(e);
        } finally {
          refreshingToken = null;
        }
      },
    ),
  );

  dio.interceptors.add(SimpleLogInterceptor());
  return dio;
});
