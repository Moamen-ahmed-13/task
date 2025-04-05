import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/controller/auth_controller.dart';
import 'package:task/presentation/screens/auth/signin.dart';
import 'package:task/presentation/screens/pages/home.dart';

class ControlView extends GetWidget<AuthController> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<AuthController>().user != null)
            ? HomeScreen()
            : SigninScreen();
      },
    );
  }
}
