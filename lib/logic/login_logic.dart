import 'package:flutter/material.dart';

class LoginLogic {
  // <---------------validate email--------------------->
  String? validateEmail(String email) {
    if (email.isEmpty) return "Email is required";
    if (!email.contains("@")) return "Email must contain @";
    return null;
  }

  // <------------------validate password-------------------------->
  String? validatePassword(String password) {
    if (password.isEmpty) return "Password is required";
    if (password.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  // <-----------------------login function----------------------->
  void login(BuildContext context, String email, String password) {
    final emailError = validateEmail(email.trim());
    final passError = validatePassword(password.trim());

    if (emailError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(emailError)),
      );
      return;
    }

    if (passError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(passError)),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login Successful ✅")),
    );
  }
}
