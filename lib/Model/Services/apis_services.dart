import 'package:jobsque_flutter/Model/Services/EndPoints.dart';
import 'package:jobsque_flutter/Model/Services/dioHelper.dart';

class ApiService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await DioHelper.postData(
        url: logiiin,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<Map<String, dynamic>> createAccount(
      String username, String email, String password) async {
    try {
      final response = await DioHelper.postData(
        url: Creataccount,
        data: {
          "username": username,
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        throw Exception('Failed to create account');
      }
    } catch (e) {
      throw Exception('Failed to create account: $e');
    }
  }
}
