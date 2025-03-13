import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/View/ForgetPassword/ForgetPasswordScreen.dart';
import 'package:mepro_app/View/OnBoardingScreens/LetsStartScreen.dart';
import 'package:mepro_app/View/OnBoardingScreens/OnboardingScreen_1.dart';
import 'package:mepro_app/View/SignIn/SignInScreen.dart';
import 'package:mepro_app/View/SignUp/SignUpScreen.dart';
import 'package:mepro_app/View/SplashScreen/SplashScreen.dart';

import '../View/ForgetPassword/NewPasswordScreen.dart';
import '../View/ForgetPassword/OTPCodeScreen.dart';
import '../View/HomeScreen/HomeScreen.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: RoutesName.onBoardingScreen_1,
      page: () => OnboardingScreen_1(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.letsStartScreen,
      page: () => LetsStartScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.signUpscreen,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.signInscreen,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,

    ),
    GetPage(
      name: RoutesName.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.oTPCodeScreen,
      page: () => OTPCodeScreen(),
      transition: Transition.rightToLeft,
    ),GetPage(
      name: RoutesName.newPasswordScreen,
      page: () => NewPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.zoom,
    ),
  ];
}
