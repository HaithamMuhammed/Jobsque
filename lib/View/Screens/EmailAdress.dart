// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class Emailadress extends StatelessWidget {
  const Emailadress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Email Adress'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Mytext(text: "Main e-mail address"),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: "rafifdian12@gmail.com",
                obscureText: false,
                prefix: Image.asset("images/sms.png"),
              ),
              Spacer(),
              Mybutton(text: "Save", onPressed: () {})
            ],
          )),
    );
  }
}
