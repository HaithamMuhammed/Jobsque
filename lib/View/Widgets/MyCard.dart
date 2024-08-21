// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/TypeOfWork/typeofwork_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class MyCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final int index;
  final String CustomImagePath;
  final bool ApplyColorFilter;

  MyCard({
    required this.label,
    required this.isSelected,
    required this.index,
    required this.CustomImagePath,
    this.ApplyColorFilter = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TypeofworkCubit>().toggleSelection(index);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? Color(0xFF3366FF) : Colors.grey,
          ),
        ),
        color: isSelected
            ? const Color(0xFF3366FF).withOpacity(0.2)
            : Colors.white,
        child: Container(
          width: 30,
          height: 30,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                CustomImagePath,
                width: 50,
                height: 70,
                color:
                    ApplyColorFilter && isSelected ? Color(0xFF3366FF) : null,
              ),
              SizedBox(height: 8),
              Mytext(
                text: label,
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
