import 'package:get/get.dart';
import 'package:task/core/bindings/bindings.dart';
import 'package:task/presentation/screens/auth/forget_password.dart';
import 'package:task/presentation/screens/auth/signin.dart';
import 'package:task/presentation/screens/auth/signup.dart';
import 'package:task/presentation/screens/pages/control_view.dart';
import 'package:task/presentation/screens/pages/details.dart';
import 'package:task/presentation/screens/pages/home.dart';

class AppRoutes {
  static const signinScreen = Routes.signinScreen;
  static const controlView = Routes.controlView;
  static final routes = [
    GetPage(
      name: Routes.controlView,
      page: () => ControlView(),
    ),
    GetPage(
      name: Routes.signinScreen,
      page: () => SigninScreen(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.detailsScreen,
      page: () => DetailsScreen(),
      binding: Binding(),
    ),
  ];
}

class Routes {
  static const controlView = '/control-view';
  static const signinScreen = '/signin';
  static const signupScreen = '/signup';
  static const forgetPasswordScreen = '/forget-password';
  static const homeScreen = '/home';
  static const detailsScreen = '/details';
}
