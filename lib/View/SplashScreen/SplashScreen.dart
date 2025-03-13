import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';

import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print("SplashScreen Loaded");  // Debug Log
    Timer(const Duration(seconds: 3), () {
      print("Navigating to Onboarding Screen");  // Debug Log
      Get.offAllNamed(RoutesName.onBoardingScreen_1);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red_mainColor,
      body: SafeArea(
        child: Column(
          children: [
            // Main content - centered vertically
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Diamond logo
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: SvgPicture.asset(MyImageClass.logo),
                    ),
                    const SizedBox(height: 20),

                    // Mepro text
                    const Text(
                      'Mepro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Loading indicator at bottom
            const Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}