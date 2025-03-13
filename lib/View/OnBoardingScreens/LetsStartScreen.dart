import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';
import '../../res/Widgets/CustomButton.dart';
import '../../res/Widgets/SocialLogInButton.dart';
import '../../res/const/ScreenSize.dart';

class LetsStartScreen extends StatelessWidget {
  const LetsStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.screenWidth(context) * 0.08,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: ScreenSize.screenHeight(context) * 0.08),
                // Logo
                SvgPicture.asset(
                  MyImageClass.logo,
                  height: ScreenSize.screenHeight(context) * 0.07,
                  color: const Color(0xFFFF5A6E),
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.04),
                // Main Title
                Text(
                  "Let's Get Started!",
                  style: TextStyle(
                    fontSize: ScreenSize.screenWidth(context) * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
                // Subtitle
                Text(
                  "Let's dive in into your account",
                  style: TextStyle(
                    fontSize: ScreenSize.screenWidth(context) * 0.035,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.05),
                // Social login buttons
                SocialLoginButton(
                  svg: MyImageClass.google,
                  text: "Continue with Google",
                  isSvg: true,
                  assetIcon: Icons.g_mobiledata,
                  onPressed: () {
                    // Handle Google login
                  },
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
                SocialLoginButton(
                  text: "Continue with Apple",
                  isSvg: false, // Changed to true since it's an SVG
                  assetIcon: Icons.apple,
                  onPressed: () {
                    // Handle Apple login
                  },
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
                SocialLoginButton(
                  text: "Continue with Facebook",
                  isSvg: false, // Changed to true since it's an SVG
                  assetIcon: Icons.facebook,
                  onPressed: () {
                    // Handle Facebook login
                  },
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
                SocialLoginButton(
                  svg: MyImageClass.twitter,
                  text: "Continue with Twitter",
                  isSvg: true,
                  assetIcon: Icons.flutter_dash,
                  onPressed: () {
                    // Handle Twitter login
                  },
                ),

                SizedBox(height: ScreenSize.screenHeight(context) * 0.05),
                // Sign up button
                CustomButton(
                  text: "Sign up",
                  isPrimary: true,
                  onPressed: () {
                    // Handle sign up
                    Get.toNamed(RoutesName.signUpscreen);
                  },
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
                // Sign in button
                CustomButton(
                  text: "Sign in",
                  isPrimary: false,
                  onPressed: () {
                    // Handle sign in
                    Get.toNamed(RoutesName.signInscreen);

                  },
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.04),
                // Footer text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenSize.screenWidth(context) * 0.035,
                      ),
                    ),
                    Text(
                      " ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenSize.screenWidth(context) * 0.035,
                      ),
                    ),
                    Text(
                      "Terms of Service",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenSize.screenWidth(context) * 0.035,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




