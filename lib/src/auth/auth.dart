import 'package:ecommerce_application/src/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: StyledButton(
              onPressed: () {
                !loggedIn ? Get.toNamed('/register') : signOut();
              },
              child: !loggedIn ? const Text('Log In') : const Text('Logout')),
        ),
        Visibility(
          visible: loggedIn,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 8),
            child: StyledButton(
                onPressed: () {
                  Get.toNamed('/profile');
                },
                child: const Text('Profile')),
          ),
        )
      ],
    );
  }
}
