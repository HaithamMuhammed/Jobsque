// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutabl, unnecessary_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:jobsque_flutter/View/Screens/CreatAccount.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class Introscreen extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset(
            "images/Group 1.png",
            fit: BoxFit.cover,
            width: BoxConstraints.expand().maxWidth,
          ),
          titleWidget: Image.asset("images/Tittle.png"),
          body: ""),
      // View[1]
      PageViewModel(
          image: Image.asset(
            fit: BoxFit.cover,
            width: BoxConstraints.expand().maxWidth,
            "images/1.png",
          ),
          titleWidget: Image.asset("images/Tittle2.png"),
          body: ""),
      // View[2]
      PageViewModel(
          image: Image.asset(
            fit: BoxFit.cover,
            width: BoxConstraints.expand().maxWidth,
            "images/Background.png",
          ),
          titleWidget: Image.asset("images/Tittle3.png"),
          body: ""),
    ];
  }

  const Introscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "images/Logo.png",
            width: 80,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Creataccount(),
                    ));
              },
              child: Mytext(
                text: "Skip",
                style: TextStyle(
                  color: Color(0xFF3366FF),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: IntroductionScreen(
            showNextButton: true,
            next: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF3366FF),
            ),
            done: Text(
              "Let's Start",
              style: TextStyle(
                color: Color(0xFF3366FF),
              ),
            ),
            onDone: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Creataccount()));
            },
            pages: getPages(),
            dotsDecorator: DotsDecorator(
                color: Color(0xFFADC8FF), activeColor: Color(0xFF3366FF)),
          ),
        ));
  }
}
