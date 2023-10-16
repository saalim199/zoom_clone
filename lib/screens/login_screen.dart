import 'package:flutter/material.dart';
import 'package:zoom_clone/Widgets/custom_button.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/utils/Routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(
            text: 'Login',
            onPressed: () async {
              bool res = await AuthMethods().signInWithGoogle(context);
              if (res == true) {
                Navigator.pushNamed(context, home);
              }
            },
          )
        ],
      ),
    );
  }
}
