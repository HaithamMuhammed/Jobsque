// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:jobsque_flutter/Model/Services/EndPoints.dart';
import 'package:jobsque_flutter/Model/Services/dioHelper.dart';
import 'package:jobsque_flutter/View/Screens/homeScreen.dart';
import 'package:jobsque_flutter/shared_Preferences/sharedPreferencesHelper.dart';

class CreataccountCubit extends Cubit<bool> {
  final GlobalKey<FormState> creatKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  CreataccountCubit() : super(false);

  Future<void> createAccount(BuildContext context) async {
    if (creatKey.currentState!.validate()) {
      emit(true);

      try {
        final response = await DioHelper.postData(
          url: Creataccount,
          data: {
            "name": nameController.text,
            "email": emailController.text,
            "password": passController.text,
          },
        );

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          // Save the user’s name to shared preferences
          final cache = Cache();
          await cache.cacheInitialization();
          await cache.saveString('userName', nameController.text);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Account created successfully'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Homescreen()),
          );
        } else {
          final errorMessage = response.data['massege'];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to create account: $errorMessage'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        print('Error creating account: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create account: $e')),
        );
      } finally {
        emit(false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      emit(false);
    }
  }
}
