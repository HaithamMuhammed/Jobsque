import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://project2.amit-learning.com/api/',
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    Options? options,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
    };

    return await dio.get(
      url,
      queryParameters: query,
      options: options,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
    Options? options,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    try {
      final response = await dio.post(
        url,
        queryParameters: query,
        data: data,
        options: options,
      );
      print('Request URL: ${dio.options.baseUrl}$url');
      print('Request Data: $data');
      print('Response Status: ${response.statusCode}');
      print('Response Data: ${response.data}');
      return response;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  static Future<Response> postFormData({
    required String url,
    required FormData formData,
    Map<String, dynamic>? query,
    String? token,
    Options? options,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: formData,
      options: options,
    );
  }

  /// Put Data Function
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio.put(
      url,
      data: (data)!,
      queryParameters: query,
    );
  }

  /// Delete data function
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    return dio.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
