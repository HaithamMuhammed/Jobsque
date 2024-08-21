// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Screens/Two_Step_verfication_Add_Number.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class TwoStepVerificationScreen extends StatefulWidget {
  @override
  _TwoStepVerificationScreenState createState() =>
      _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState extends State<TwoStepVerificationScreen> {
  bool isTwoStepVerificationEnabled = false;

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
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              activeColor: Color(0xFFD6E4FF),
              activeTrackColor: Color(0xFF3366FF),
              inactiveThumbColor: Color(0xFFD1D5DB).withOpacity(0.5),
              inactiveTrackColor: Color(0xFFD1D5DB),
              trackOutlineColor: WidgetStatePropertyAll(Colors.white),
              title: Mytext(
                  text: 'Secure your account with two-step verification'),
              value: isTwoStepVerificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isTwoStepVerificationEnabled = value;
                });
              },
            ),
            if (isTwoStepVerificationEnabled) ...[
              SizedBox(height: 16),
              Center(child: Mytext(text: 'Select a verification method')),
              Center(
                child: DropdownButton<String>(
                  value: 'Telephone number (SMS)',
                  items: <String>['Telephone number (SMS)'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
              ),
              SizedBox(height: 16),
              Mytext(
                text:
                    'Note: Turning this feature on will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign in with a new device or Joby mobile application.',
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Mybutton(
                text: "Next",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNumberVerify()));
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
