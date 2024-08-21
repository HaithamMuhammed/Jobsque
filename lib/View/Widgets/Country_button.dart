// ignore_for_file: sort_child_properties_last, prefer_const_constructors, file_names, use_super_parameters

import 'package:flutter/material.dart';

class CountryButton extends StatelessWidget {
  final String country;
  final bool isSelected;
  final VoidCallback onPressed;

  const CountryButton({
    Key? key,
    required this.country,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(country),
      style: ElevatedButton.styleFrom(
        foregroundColor: Color(0xFF111827),
        backgroundColor: isSelected ? Color(0xFFD6E4FF) : Colors.white,
        side: BorderSide(color: isSelected ? Color(0xFF3366FF) : Colors.grey),
        shadowColor: Color(0xFFD6E4FF),
        textStyle: TextStyle(fontSize: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 3,
      ),
    );
  }
}
