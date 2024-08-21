import 'package:dio/dio.dart';
import 'package:jobsque_flutter/Model/Services/ProfileApiModel.dart';
import 'package:jobsque_flutter/Model/Services/dioHelper.dart';

class ProfileApiService {
  Future<profile?> fetchProfile({String? token}) async {
    try {
      Response response = await DioHelper.getData(
        url: 'auth/profile',
        token: token,
      );

      if (response.statusCode == 200) {
        final json = response.data;
        return profile.fromJson(json);
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (error) {
      print('Error fetching profile: $error');
      rethrow;
    }
  }
}
