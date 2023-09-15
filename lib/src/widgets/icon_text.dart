import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  Color textColor;
  Color iconColor;
  double textSize;

  IconText({
    super.key,
    required this.icon,
    required this.text,
    this.textColor = Colors.black,
    this.iconColor = Colors.grey,
    this.textSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(fontSize: textSize, color: textColor),
        ),
      ],
    );
  }
}
