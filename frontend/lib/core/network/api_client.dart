import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  static const String baseUrl = 'https://sports-app-oysb.onrender.com/api';

  ApiClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 3),
            headers: {'Content-Type': 'application/json'},
          ),
        );

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
