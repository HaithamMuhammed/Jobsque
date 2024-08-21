// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  bool usePhoneNumberForReset = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Phone Number'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Mytext(text: "Main Phone Number"),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: "0100-666-7234",
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Mytext(
                    text: "Use the phone number to reset your password",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Switch(
                    activeColor: Color(0xFFD6E4FF),
                    activeTrackColor: Color(0xFF3366FF),
                    inactiveThumbColor: Color(0xFFD1D5DB).withOpacity(0.5),
                    inactiveTrackColor: Color(0xFFD1D5DB),
                    trackOutlineColor: WidgetStatePropertyAll(Colors.white),
                    value: usePhoneNumberForReset,
                    onChanged: (bool value) {
                      setState(() {
                        usePhoneNumberForReset = value;
                      });
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
