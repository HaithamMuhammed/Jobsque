// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';

class Mytext extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  Mytext({required this.text, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
