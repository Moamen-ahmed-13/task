import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/routes/routes.dart';
import 'package:task/presentation/controller/auth_controller.dart';
import 'package:task/presentation/widgets/app_button.dart';
import 'package:task/presentation/widgets/custom_button.dart';
import 'package:task/presentation/widgets/custom_text_form_field.dart';

class SigninScreen extends GetWidget<AuthController> {
  SigninScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 60,
              left: 15,
              right: 15,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Welcome,',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.signupScreen);
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(color: primaryColor),
                                    )),
                              ]),
                          Text(
                            'Sign in to Continue',
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          SizedBox(height: 60),
                          CustomTextFormField(
                            secured: false,
                            fieldName: 'Email',
                            hintText: 'user@example.com',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.email = value!;
                            },
                          ),
                          SizedBox(height: 40),
                          CustomTextFormField(
                            secured: true,
                            fieldName: 'Password',
                            hintText: '**********',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.password = value!;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgetPasswordScreen);
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          AppButton(
                            onPressed: () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                controller.signInWithEmailAndPassword();
                              }
                            },
                            text: 'SIGN IN',
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '-OR-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    _formKey.currentState!.save();

                    controller.signInWithGoogle();
                  },
                  image: 'assets/google.png',
                  text: '  Continue with Google',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
