import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({super.key, required this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    );
  }
}