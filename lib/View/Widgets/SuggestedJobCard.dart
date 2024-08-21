// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/JobTag.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class SuggestedJobCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF091A7A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Designer',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 8),
          Text(
            'Zoom • United States',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              JobTag('Fulltime'),
              SizedBox(width: 8),
              JobTag('Remote'),
              SizedBox(width: 8),
              JobTag('Design'),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '\$12K-15K/Month',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
            ),
            child: Mytext(text: 'Apply now'),
          ),
        ],
      ),
    );
  }
}
