import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/helper/show_snack_bar.dart';
import 'package:pharmacy_app/services/login_service.dart';
import 'package:pharmacy_app/widgets/custom_button.dart';
import 'package:pharmacy_app/widgets/form_text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static String id = kLoginScreen;
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String? phoneNumber;
    String? password;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/images/Pharmacy-Desk-Resized.png'),
                const SizedBox(
                  height: 70,
                ),
                CustomFormTextField(
                  hintText: 'Phone Number',
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormTextField(
                  hintText: 'Password',
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  buttonColor: Colors.black,
                  hintColor: Colors.white,
                  hint: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {});
                      try {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, kHomeScreen,
                            arguments: await login(body: {
                              'phone_number': phoneNumber,
                              'password': password
                            }));
                        // ignore: unused_catch_clause
                      } on Exception catch (e) {
                        // ignore: use_build_context_synchronously
                        showSnackBar(context, e.toString());
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
