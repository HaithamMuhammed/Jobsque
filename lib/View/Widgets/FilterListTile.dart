import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class FilterListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget? leading;

  const FilterListTile({
    required this.title,
    required this.onTap,
    this.leading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: leading,
            title: Mytext(text: title),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
