// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/SwitchButton/switchbutton_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class SwitchTile extends StatelessWidget {
  final String title;
  final String keyName;

  const SwitchTile({
    required this.title,
    required this.keyName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchbuttonCubit, Map<String, bool>>(
      builder: (context, state) {
        return ListTile(
          title: Mytext(
            text: title,
          ),
          trailing: Switch(
            activeColor: Color(0xFFD6E4FF),
            activeTrackColor: Color(0xFF3366FF),
            inactiveThumbColor: Color(0xFFD1D5DB).withOpacity(0.5),
            inactiveTrackColor: Color(0xFFD1D5DB),
            trackOutlineColor: WidgetStatePropertyAll(Colors.white),
            value: state[keyName]!,
            onChanged: (newValue) {
              context.read<SwitchbuttonCubit>().toggleSwitch(keyName);
            },
          ),
        );
      },
    );
  }
}
