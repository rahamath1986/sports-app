import 'package:dio/dio.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class ApiClient {
  final Dio dio;
  static const String baseUrl = 'https://sports-app-oysb.onrender.com/api';

  ApiClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 10),
            headers: {'Content-Type': 'application/json'},
          ),
        ) {
    dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    // Basic error handling logic
    return Exception(e.message ?? 'Unknown error occurred');
  }
}
