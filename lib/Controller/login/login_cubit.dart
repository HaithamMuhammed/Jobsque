// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobsque_flutter/View/Screens/homeScreen.dart';

class LoginCubit extends Cubit<bool> {
  final GlobalKey<FormState> logKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Dio dio = Dio();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  LoginCubit() : super(false);

  Future<void> login(BuildContext context) async {
    if (logKey.currentState!.validate()) {
      emit(true);

      try {
        final response = await dio.post(
          "https://project2.amit-learning.com/api/auth/login",
          data: {
            "email": emailController.text,
            "password": passwordController.text,
          },
        );

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final token = response.data["token"];
          await secureStorage.write(key: 'auth_token', value: token);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Homescreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Failed to login: ${response.data["message"]}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: Invalid email')),
        );
      } finally {
        emit(false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Wrong Email or Password",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }
}
