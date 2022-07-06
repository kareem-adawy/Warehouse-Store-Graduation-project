import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Binding/Auth_binding.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Binding/main_binding.dart';
import 'package:mansour_udemy/Amazon%20Shop/Logic/Binding/product_binding.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/Auth/forget_password_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/Auth/login_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/Auth/signup_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/cart_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/home_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/main_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/payment_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/welcome_screen.dart';

class AppRoutes {
//initialRoute
  static const welcome = Routes.welcome_screen;
  static const mainScreen = Routes.MainScreen;

//getPages
  static final routes = [
    GetPage(
      name: Routes.welcome_screen,
      page: () => welcome_screen(),
    ),
    GetPage(
      name: Routes.Home_Screen,
      page: () => Home_Screen(),
    ),
    GetPage(
      name: Routes.LoginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.CartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.SignupScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.ForgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.PayMentScreen,
      page: () => PayMentScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcome_screen = "/welcome_screen";
  static const LoginScreen = "/LoginScreen";
  static const MainScreen = "/MainScreen";
  static const SignupScreen = "/SignupScreen";
  static const CartScreen = "/CartScreen";
  static const Home_Screen = "/Home_Screen";
  static const PayMentScreen = "/PayMentScreen";
  static const ForgetPasswordScreen = "/ForgetPasswordScreen";
}
