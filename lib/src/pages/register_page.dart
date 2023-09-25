import 'package:ecommerce_application/src/controllers/auth_controller.dart';
import 'package:ecommerce_application/src/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final registerController = Get.put(RegisterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Email"),
            controller: registerController.email,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Password"),
            controller: registerController.password,
            obscureText: true,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  authController.register(registerController.email.text.trim(),
                      registerController.password.text.trim());
                },
                child: const Text("Sign Up"),
              ),
              ElevatedButton(
                onPressed: () async {
                  authController.login(registerController.email.text.trim(),
                      registerController.password.text.trim());
                },
                child: const Text("Login"),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              authController.signInWithGoogle();
            },
            child: const Text("Sign In with Google"),
          ),
        ],
      ),
    );
  }
}
