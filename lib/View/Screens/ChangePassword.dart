// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Change password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Mytext(text: "Enter your old password"),
                    SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "Password must be at least 8 characters";
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter your Password",
                      prefix: Image.asset("images/lock.png"),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Mytext(text: "Enter your New password"),
                    SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "Password must be at least 8 characters";
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter your Password",
                      prefix: Image.asset("images/lock.png"),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Mytext(text: "Confirm your new password"),
                    SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                      validate: (value) {
                        if (value!.length < 8) {
                          return "Password must be at least 8 characters";
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter your Password",
                      prefix: Image.asset("images/lock.png"),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            Mybutton(
              text: "Save",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
