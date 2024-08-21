import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/Select%20language/select_language_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/LanguageItems.dart';

class LanguageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectLanguageCubit, String>(
      builder: (context, selectedLanguage) {
        return ListView(
          children: [
            LanguageItem(
              name: 'English',
              flag: '🇬🇧',
              isSelected: selectedLanguage == 'English',
            ),
            LanguageItem(
              name: 'Indonesia',
              flag: '🇮🇩',
              isSelected: selectedLanguage == 'Indonesia',
            ),
            LanguageItem(
              name: 'Arabic',
              flag: '🇸🇦',
              isSelected: selectedLanguage == 'Arabic',
            ),
            LanguageItem(
              name: 'Chinese',
              flag: '🇨🇳',
              isSelected: selectedLanguage == 'Chinese',
            ),
            LanguageItem(
              name: 'Dutch',
              flag: '🇳🇱',
              isSelected: selectedLanguage == 'Dutch',
            ),
            LanguageItem(
              name: 'French',
              flag: '🇫🇷',
              isSelected: selectedLanguage == 'French',
            ),
            LanguageItem(
              name: 'German',
              flag: '🇩🇪',
              isSelected: selectedLanguage == 'German',
            ),
            LanguageItem(
              name: 'Japanese',
              flag: '🇯🇵',
              isSelected: selectedLanguage == 'Japanese',
            ),
            LanguageItem(
              name: 'Korean',
              flag: '🇰🇷',
              isSelected: selectedLanguage == 'Korean',
            ),
            LanguageItem(
              name: 'Portuguese',
              flag: '🇵🇹',
              isSelected: selectedLanguage == 'Portuguese',
            ),
          ],
        );
      },
    );
  }
}
