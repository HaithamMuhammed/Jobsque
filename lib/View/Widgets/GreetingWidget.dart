// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/shared_Preferences/sharedPreferencesHelper.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error loading name');
        } else {
          final userName = snapshot.data ?? 'User';
          return Row(
            children: [
              Text(
                "Hi, $userName 👋",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              Spacer(),
            ],
          );
        }
      },
    );
  }

  Future<String?> _getUserName() async {
    final cache = Cache();
    await cache.cacheInitialization();
    return cache.getString('userName');
  }
}
