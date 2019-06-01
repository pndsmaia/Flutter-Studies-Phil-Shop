import 'package:flutter/material.dart';

class GradientBackGround extends StatelessWidget {
  final Color initialColor;
  final Color endColor;
  final Alignment beginAlignment;
  final Alignment endAlignment;

  GradientBackGround(this.initialColor, this.endColor,
      {this.beginAlignment, this.endAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [initialColor, endColor],
            begin: beginAlignment ?? Alignment.topLeft,
            end: endAlignment ?? Alignment.bottomRight),
      ),
    );
  }
}
