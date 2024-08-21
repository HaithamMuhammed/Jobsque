import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/Select%20language/select_language_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class LanguageItem extends StatelessWidget {
  final String name;
  final String flag;
  final bool isSelected;

  LanguageItem({
    required this.name,
    required this.flag,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Mytext(text: flag, style: TextStyle(fontSize: 24)),
      title: Text(name),
      trailing: GestureDetector(
        onTap: () {
          context.read<SelectLanguageCubit>().selectLanguage(name);
        },
        child: Icon(
          isSelected
              ? Icons.check_circle_outline_rounded
              : Icons.radio_button_unchecked,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
