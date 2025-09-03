import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// 토큰 저장소
final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());

/// Dio 기본 옵션
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

/// 요청/응답 로깅 인터셉터 (디버그용)
class SimpleLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      '[REQ] ${options.method} ${options.uri}\nHeaders: ${options.headers}\nData: ${options.data}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      '[RES] ${response.statusCode} ${response.requestOptions.uri}\nData: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      '[ERR] ${err.requestOptions.method} ${err.requestOptions.uri}\nType: ${err.type}\nMessage: ${err.message}\nData: ${err.response?.data}',
    );
    super.onError(err, handler);
  }
}

/// Authorization 헤더 주입 인터셉터
class AuthTokenInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  AuthTokenInterceptor(this.storage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: 'access_token');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

/// Riverpod: Dio 주입
final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(secureStorageProvider);
  final dio = Dio(_baseOptions())
    ..interceptors.addAll([
      AuthTokenInterceptor(storage),
      SimpleLogInterceptor(),
    ]);
  return dio;
});
