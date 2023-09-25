// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  double size;
  Color color;
  TextOverflow overflow;
  HeaderText({
    super.key,
    required this.text,
    this.size = 20,
    this.color = Colors.black,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
