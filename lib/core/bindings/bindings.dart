import 'package:get/get.dart';
import 'package:task/presentation/controller/auth_controller.dart';
import 'package:task/presentation/controller/details_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DetailsController());
  }
}