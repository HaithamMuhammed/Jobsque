// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/CustomTextFormField.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/Mybutton.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Mytext(
            text: 'Personal Details',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/profileimage.png'),
                      child: IconButton(
                        icon: Image.asset("images/camera.png"),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 7),
                    TextButton(
                        onPressed: () {},
                        child: Mytext(
                          text: "Change photo",
                          style: TextStyle(color: Color(0xFF3366FF)),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      hintText: 'Rafif Dian Axelingga',
                      obscureText: false,
                    ),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: 'Senior UI/UX Designer',
                      obscureText: false,
                    ),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: 'Ranjingan, Wangon, Wasington City',
                      obscureText: false,
                    ),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: '0100-666-7234',
                      obscureText: false,
                    ),
                    SizedBox(height: 70),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Mybutton(
                          onPressed: () {},
                          text: 'Save',
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ));
  }
}
