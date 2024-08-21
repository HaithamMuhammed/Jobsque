// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class ContainerWithTitle extends StatelessWidget {
  final String title;

  const ContainerWithTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE5E7EB),
      padding: EdgeInsets.all(7),
      child: Mytext(
        text: title,
        style: TextStyle(color: Color(0xFF6B7280), fontSize: 18),
      ),
    );
  }
}
