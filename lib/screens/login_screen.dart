import 'package:flutter/material.dart';
import 'package:flutter_login_ui/logic/login_logic.dart';
import 'package:flutter_login_ui/widget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  late final LoginLogic logic;

  @override
  void initState() {
    super.initState();
    logic = LoginLogic();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Login Screen",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // <----------------------email  --------------------------------->
            TextFieldWidget(
              controller: emailController,
              text: "Enter your Email",
              icon: const Icon(Icons.email),
            ),
            const SizedBox(height: 10),

            // <----------------------------------------Password ----------------------------------------->
            TextFieldWidget(
              controller: passController,
              text: "Enter your Password",
              icon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 20),

            // <--------------------------------------------Login button------------------------->
            ElevatedButton(
              onPressed: () {
                logic.login(
                  context,
                  emailController.text,
                  passController.text,
                );
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 10),

            const Text(
              "Don't have an Account? Register",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
