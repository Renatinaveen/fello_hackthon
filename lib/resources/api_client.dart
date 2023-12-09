import 'package:dio/dio.dart';
import 'package:fello_hackthon/resources/constants.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  final Dio _dio = Dio();

  // Base URL of your API
  final String baseUrl = Constants.baseURL;

  ApiClient() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    _dio.options.receiveTimeout = const Duration(seconds: 3); // 3 seconds

    // Add any additional configurations here
    // For example, you can add interceptors, headers, etc.
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _handleError(dynamic error) {
    debugPrint('error: $error');
    return error;
  }
}
