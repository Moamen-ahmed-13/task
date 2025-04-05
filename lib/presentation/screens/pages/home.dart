import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/routes/routes.dart';
import 'package:task/presentation/screens/auth/signup.dart';
import 'package:task/presentation/widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Welcome,',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => SignupScreen());
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(color: primaryColor),
                  )),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.4),
            Center(
              child: AppButton(
                  text: "Home",
                  onPressed: () {
                    Get.toNamed(Routes.detailsScreen);
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
