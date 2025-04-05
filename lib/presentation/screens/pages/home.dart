import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/screens/pages/details.dart';
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
        child: Center(
          child: AppButton(
              text: "Home",
              onPressed: () {
                Get.to(() => DetailsScreen());
              }),
        ),
      ),
    ));
  }
}
