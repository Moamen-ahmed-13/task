import 'package:flutter/material.dart';
import 'package:task/core/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      //  () {
      // _formKey.currentState!.save();
      // if (_formKey.currentState!.validate()) {
      //   // controller.emailAndPasswordSignIn();
      // }
      // },
      color: primaryColor,
      minWidth: double.infinity,
      height: 50,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
