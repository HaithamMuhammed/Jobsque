// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/DropDownbutton/dropdown_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class MyDropdownFormField extends StatelessWidget {
  final String labelText;
  final List<String> items;

  const MyDropdownFormField({
    Key? key,
    required this.labelText,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit, String?>(
      builder: (context, selectedValue) {
        return DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          items: items.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Mytext(
                text: type,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            );
          }).toList(),
          onChanged: (value) {
            context.read<DropdownCubit>().selectWorkType(value);
          },
          value: selectedValue,
        );
      },
    );
  }
}
