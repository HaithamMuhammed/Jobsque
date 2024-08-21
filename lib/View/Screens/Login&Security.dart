// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Screens/ChangePassword.dart';
import 'package:jobsque_flutter/View/Screens/CompleteProfile.dart';
import 'package:jobsque_flutter/View/Screens/EmailAdress.dart';
import 'package:jobsque_flutter/View/Screens/PhoneNumber.dart';
import 'package:jobsque_flutter/View/Screens/Two_Step_Verfication.dart';
import 'package:jobsque_flutter/View/Widgets/MyContainer.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class LoginSecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Mytext(text: 'Login and Security'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ContainerWithTitle(title: "Account access"),
          ListTile(
            title: Mytext(text: 'Email address'),
            subtitle: Mytext(text: 'ralfidian12@gmail.com'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Emailadress()));
            },
          ),
          ListTile(
            title: Mytext(text: 'Phone number'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PhoneNumber()));
            },
          ),
          ListTile(
            title: Mytext(text: 'Change password'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePassword()));
            },
          ),
          ListTile(
            title: Mytext(text: 'Two-step verification'),
            subtitle: Mytext(text: 'Non active'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TwoStepVerificationScreen()));
            },
          ),
          ListTile(
            title: Mytext(text: 'Complete Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompleteProfileScreen()));
            },
          ),
        ],
      ),
    );
  }
}
