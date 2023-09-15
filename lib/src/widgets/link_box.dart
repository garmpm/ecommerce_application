import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LinkBox extends StatelessWidget {
  final Widget child;
  final String route;
  double width;
  double height;

  LinkBox({
    super.key,
    required this.child,
    required this.route,
    this.height = 20,
    this.width = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(route);
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: -3,
                offset: Offset(0, 7),
              ),
            ]),
        child: child,
      ),
    );
  }
}
