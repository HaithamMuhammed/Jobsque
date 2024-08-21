// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class CodeInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
