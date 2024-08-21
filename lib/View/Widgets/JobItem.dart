// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/StepCircle.dart';
import 'package:jobsque_flutter/View/Widgets/StepDivider.dart';

class Jobitem extends StatelessWidget {
  final String companyName;
  final String location;
  final bool isRemote;
  final bool isFulltime;
  final int postedDaysAgo;
  final String avatarUrl;

  Jobitem({
    required this.companyName,
    required this.location,
    required this.isRemote,
    required this.isFulltime,
    required this.postedDaysAgo,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                avatarUrl,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'UI/UX Designer',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 8),
                    Mytext(
                      text: '$companyName • $location',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Chip(
                          side: BorderSide.none,
                          backgroundColor: Color(0xFFD6E4FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: Mytext(
                            text: 'Fulltime',
                            style: TextStyle(color: Color(0xFF3366FF)),
                          ),
                        ),
                        SizedBox(width: 8),
                        Chip(
                          side: BorderSide.none,
                          backgroundColor: Color(0xFFD6E4FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: Mytext(
                            text: 'Remote',
                            style: TextStyle(color: Color(0xFF3366FF)),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Posted $postedDaysAgo days ago',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: 379,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              border: Border.all(
                width: 1,
                color: Color(0xFFD1D5DB),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StepCircle(
                    stepNumber: 1,
                    label: 'Biodata',
                    isCompleted: true,
                  ),
                  StepDivider(),
                  StepCircle(
                    stepNumber: 2,
                    label: 'Type of work',
                    isCompleted: false,
                  ),
                  StepDivider(),
                  StepCircle(
                    stepNumber: 3,
                    label: 'Upload portfolio',
                    isCompleted: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
