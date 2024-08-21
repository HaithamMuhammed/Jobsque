// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class QuestionsList extends StatelessWidget {
  final List<String> questions = [
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
  ];

  final String answer =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
      "Fusce ultricies mi enim, quis vulputate nibh faucibus at. "
      "Maecenas at ante, suscipit vel sem non, blandit blandit erat. "
      "Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec "
      "fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. "
      "Curabitur ac leo sit amet leo interdum mattis vel eu mauris.";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Mytext(text: questions[index]),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Mytext(
                text: answer,
              ),
            ),
          ],
        );
      },
    );
  }
}
