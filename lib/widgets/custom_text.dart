import 'package:flutter/material.dart';
import 'package:pas_project_11pplg1s1/common/app_color.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.color,
  });
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color ?? secondaryColor,
      ),
    );
  }
}
