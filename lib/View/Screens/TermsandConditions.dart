// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class Termsandconditions extends StatelessWidget {
  const Termsandconditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Mytext(
              text: 'Terms & Conditions',
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Mytext(
                        text: "Lorem ipsum dolor",
                        style:
                            TextStyle(color: Color(0xFF111827), fontSize: 25),
                      ),
                    ],
                  ),
                  Mytext(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Mytext(
                        text: "Lorem ipsum dolor",
                        style:
                            TextStyle(color: Color(0xFF111827), fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Mytext(
                    text:
                        "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Mytext(
                        text:
                            "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.",
                        style: TextStyle(color: Colors.grey),
                      ),
                      width: double.infinity,
                      height: 144,
                      padding: EdgeInsets.fromLTRB(14, 12, 14, 12),
                      decoration: BoxDecoration(color: Color(0xFFF4F4F5))),
                  SizedBox(
                    height: 10,
                  ),
                  Mytext(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.")
                ])),
          ],
        ));
  }
}
