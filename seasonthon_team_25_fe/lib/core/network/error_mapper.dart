import 'package:dio/dio.dart';

String mapDioError(Object error) {
  if (error is DioException) {
    final res = error.response;
    final code = res?.statusCode;
    final serverMsg =
        res?.data is Map && (res?.data['message'] != null)
            ? res?.data['message'].toString()
            : null;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return '네트워크 지연이 발생했어요. 잠시 후 다시 시도해주세요.';
      case DioExceptionType.badResponse:
        if (code == 400) return serverMsg ?? '잘못된 요청입니다.';
        if (code == 401) return '로그인이 필요합니다.';
        if (code == 403) return '접근 권한이 없습니다.';
        if (code == 404) return '요청한 리소스를 찾을 수 없습니다.';
        if (code == 409) return '중복된 요청입니다.';
        if (code == 500) return '서버 오류가 발생했습니다.';
        return serverMsg ?? '요청 처리 중 오류가 발생했습니다. (code: $code)';
      case DioExceptionType.cancel:
        return '요청이 취소되었습니다.';
      default:
        return '네트워크 오류가 발생했습니다. 인터넷 연결을 확인해주세요.';
    }
  }
  return '알 수 없는 오류가 발생했습니다.';
}
