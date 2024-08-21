// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Screens/homeScreen.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class AccountSetupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Mytext(text: 'Account Setup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/Success Account Ilustration.png"),
            SizedBox(
              height: 15,
            ),
            Mytext(
              text: 'Your account has been set up!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Mytext(
              text: 'We have customized feeds according to your preferences.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Mybutton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homescreen(),
                    ));
              },
              text: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
