import 'package:flutter/material.dart';

import 'package:jobsque_flutter/View/Widgets/LanguageList.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Mytext(text: 'Language'),
        centerTitle: true,
      ),
      body: LanguageList(),
    );
  }
}
