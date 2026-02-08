import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/helper/show_snack_bar.dart';
import 'package:pharmacy_app/services/signup_service.dart';
import 'package:pharmacy_app/widgets/custom_button.dart';
import 'package:pharmacy_app/widgets/form_text_feild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
  static String id = kSingupScreen;
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String? name;
    String? phoneNumber;
    String? password;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'SignUp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/images/Pharmacy-Desk-Resized.png'),
                const SizedBox(
                  height: 60,
                ),
                CustomFormTextField(
                  hintText: 'Name',
                  onChanged: (value) => name = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormTextField(
                  hintText: 'Phone Number',
                  onChanged: (value) => phoneNumber = value,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormTextField(
                  hintText: 'Password',
                  onChanged: (value) => password = value,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                    buttonColor: Colors.black,
                    hintColor: Colors.white,
                    hint: 'SignUp',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {});
                        try {
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, kHomeScreen,
                              arguments: await signUp(body: {
                                'name': name,
                                'phone_number': phoneNumber,
                                'password': password
                              }));
                          // ignore: unused_catch_clause
                        } on Exception catch (e) {
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, e.toString());
                        }
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
