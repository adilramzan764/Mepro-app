import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Colors/Colors.dart';
import 'package:mepro_app/res/Images/MyImages.dart';
import 'package:mepro_app/res/const/ScreenSize.dart';

import '../../Routes/RoutesName.dart';
import '../../res/Widgets/Onboarding_Widgets.dart';

class OnboardingScreen_1 extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen_1> {
  PageController pageController = PageController();
  int currentIndex = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image": MyImageClass.phonemokeup1,
      "title": "Discover Rewards",
      "subtitle": "Embrace Mepro",
      "description": "Unlock exclusive perks, earn points effortlessly and indulge in a world of personalized rewards. Welcome to Mepro!"
    },
    {
      "image": MyImageClass.mobilemokeup2,
      "title": "Earn Points, Enjoy",
      "subtitle": "Rewards",
      "description": "Snap receipts, complete surveys, and more! Elevate your Mepro journey with every action! Start earning, start enjoying"
    },
    {
      "image": MyImageClass.mobilemokeup3,
      "title": "Tailor Your Rewards",
      "subtitle": "Experience",
      "description": "Convert points, redeem vouchers, and climb tiers. Your Mepro, your way. Begin your personalized rewards journey with Mepro!"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: ScreenSize.screenHeight(context) * 0.78,
                decoration: BoxDecoration(
                  color: AppColors.red_mainColor,
                ),
              ),
            ),
            PageView.builder(
              controller: pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingContent(
                  image: onboardingData[index]["image"]!,
                  title: onboardingData[index]["title"]!,
                  subtitle: onboardingData[index]["subtitle"]!,
                  description: onboardingData[index]["description"]!,
                  isLastPage: index == onboardingData.length - 1,
                  onNext: () {
                    if (currentIndex < onboardingData.length - 1) {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                    else{
                      Get.offAllNamed(RoutesName.letsStartScreen);


                    }
                  },
                );
              },
            ),
            Positioned(
              bottom: ScreenSize.screenHeight(context) * 0.13,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                      (index) => buildDot(index, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 8,
      width: currentIndex == index ? 30 : 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: currentIndex == index ? AppColors.red_mainColor : Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

