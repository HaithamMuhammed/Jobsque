import 'package:flutter/material.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:jobsque_flutter/View/Widgets/StepCircle.dart';

class StepDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color color;

  const StepDivider({
    this.height = 1.0,
    this.thickness = 50.0,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DottedClipper(),
      child: Container(
        height: height,
        width: thickness,
        color: color,
      ),
    );
  }
}

class DottedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double space = 4.0;
    Path path = Path();
    for (double i = 0; i < size.width; i += space * 2) {
      path.addRect(Rect.fromLTWH(i, 0, space, size.height));
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
