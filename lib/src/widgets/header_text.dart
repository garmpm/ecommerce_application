import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  double size;
  TextOverflow overflow;
  HeaderText(
      {super.key,
      required this.text,
      this.size = 20,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
