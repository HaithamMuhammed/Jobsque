// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class PortfolioItem extends StatelessWidget {
  final String title;
  final String fileName;
  final String size;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  PortfolioItem({
    required this.title,
    required this.fileName,
    required this.size,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Colors.white,
        leading: Image.asset("images/pdf.sign.png"),
        title: Text(title),
        subtitle: Mytext(
          text: '$fileName ($size)',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Image.asset("images/edit-2.png"),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Image.asset("images/close-circle.png"),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
