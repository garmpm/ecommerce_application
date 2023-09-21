import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
