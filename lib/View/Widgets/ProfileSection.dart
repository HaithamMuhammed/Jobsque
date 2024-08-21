// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/CompeteProfile/complete_profile_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class ProfileSection extends StatelessWidget {
  final String title;
  final String description;
  final String section;
  final VoidCallback? Onpress;

  ProfileSection({
    required this.title,
    required this.description,
    required this.section,
    required this.Onpress,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, Map<String, bool>>(
      builder: (context, state) {
        bool completed = state[section]!;
        return GestureDetector(
          onTap: () {
            context.read<CompleteProfileCubit>().toggleCompletion(section);
          },
          child: Card(
            color: completed ? Color(0xFFE0EBFF) : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), // Make it circular
              side: BorderSide(
                color: completed ? Color(0xFF84A9FF) : Colors.grey,
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(
                completed ? Icons.check_circle : Icons.radio_button_unchecked,
                color: completed ? Color(0xFF84A9FF) : Colors.grey,
              ),
              title: Mytext(text: title),
              subtitle: Mytext(text: description),
              trailing: IconButton(
                  onPressed: Onpress, icon: Icon(Icons.arrow_forward_ios)),
            ),
          ),
        );
      },
    );
  }
}
