import 'package:flutter/material.dart';

class FormController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void clearForm() {
    emailController.clear();
    passwordController.clear();
    idController.clear();
    phoneController.clear();
  }

  bool isValid() {
    return emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }
}