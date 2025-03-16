import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/View/ForgetPassword/ForgetPasswordScreen.dart';
import 'package:mepro_app/View/OnBoardingScreens/LetsStartScreen.dart';
import 'package:mepro_app/View/OnBoardingScreens/OnboardingScreen_1.dart';
import 'package:mepro_app/View/SignIn/SignInScreen.dart';
import 'package:mepro_app/View/SignUp/SignUpScreen.dart';
import 'package:mepro_app/View/SplashScreen/SplashScreen.dart';

import '../View/DailyDiamond/DailyDiamomdScreen.dart';
import '../View/ForgetPassword/NewPasswordScreen.dart';
import '../View/ForgetPassword/OTPCodeScreen.dart';
import '../View/HomeScreen/HomeScreen.dart';
import '../View/MeproTierScreen/MeproTierScreen.dart';
import '../View/MyProfileScreen/MyProfileScreen.dart';
import '../View/NotificationSettings/NotificationSettings_Screen.dart';

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
    GetPage(
      name: RoutesName.dailyDiamondScreen,
      page: () => DailyDiamondScreen(),
      transition: Transition.rightToLeft,
    )
    ,GetPage(
      name: RoutesName.meproTierScreen,
      page: () => MeproTierScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.myProfileScreen,
      page: () => MyProfileScreen(),
      transition: Transition.rightToLeft,
    ),GetPage(
      name: RoutesName.notificationSettings_Screen,
      page: () => NotificationSettings_Screen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
