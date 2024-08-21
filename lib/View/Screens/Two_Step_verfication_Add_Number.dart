// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/Creat/creataccount_cubit.dart';
import 'package:jobsque_flutter/View/Screens/SendCode_Verfication.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class AddNumberVerify extends StatefulWidget {
  const AddNumberVerify({super.key});

  @override
  State<AddNumberVerify> createState() => _AddNumberVerifyState();
}

class _AddNumberVerifyState extends State<AddNumberVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Two-step verification'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Mytext(
                        text: "Add phone number",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Mytext(
                    text: "We will send a verification code to this number",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    hintText: '0100-666****',
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Mytext(text: "Enter Your password"),
              SizedBox(
                height: 10,
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
              Spacer(),
              Mybutton(
                  text: "Send code",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SendcodeVerfication()));
                  })
            ],
          )),
    );
  }
}
