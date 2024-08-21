import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class StepCircle extends StatelessWidget {
  final int stepNumber;
  final String label;
  final bool isCompleted;

  StepCircle({
    required this.stepNumber,
    required this.label,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? Color(0Xff3366FF) : Colors.white,
            border: Border.all(
              color: isCompleted ? Color(0Xff3366FF) : Color(0xFF9CA3AF),
              width: 1,
            ),
          ),
          child: Center(
            child: Mytext(
              text: stepNumber.toString(),
              style: TextStyle(
                color: isCompleted ? Colors.white : Color(0xFF9CA3AF),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Mytext(text: label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
