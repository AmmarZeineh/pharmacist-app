import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static String id = kWelcomeScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              const Text(
                'Welcome',
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
              const SizedBox(
                height: 60,
              ),
              Image.asset('assets/images/Pharmacy-Desk-Resized.png'),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'New to our app?',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                  buttonColor: Colors.black,
                  hintColor: Colors.white,
                  hint: 'SignUp',
                  onTap: () => Navigator.pushNamed(context, kSingupScreen)),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Already have an account?',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                  buttonColor: Colors.black,
                  hintColor: Colors.white,
                  hint: 'Login',
                  onTap: () => Navigator.pushNamed(context, kLoginScreen))
            ],
          ),
        ),
      ),
    );
  }
}
