import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mepro_app/res/Colors/Colors.dart';

import '../const/ScreenSize.dart';

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final bool isLastPage;
  final VoidCallback onNext;

  const OnboardingContent({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.isLastPage,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: ScreenSize.screenHeight(context) * 0.45,
            color: AppColors.whiteColor,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: ScreenSize.screenHeight(context) * 0.05),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightgreyColor,
                    height: 1.4,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(!isLastPage)
                      Expanded(
                        child: Container(
                          height: ScreenSize.screenHeight(context) * 0.05,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.pink.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                color: AppColors.red_mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(width: ScreenSize.screenWidth(context) * 0.04),
                    Expanded(
                      child: Container(
                        height: ScreenSize.screenHeight(context) * 0.05,
                        child: ElevatedButton(
                          onPressed: onNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red_mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            isLastPage ? 'Get Started' : 'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: isLastPage ? ScreenSize.screenHeight(context) * 0.079 : ScreenSize.screenHeight(context) * 0.081,
          left: 0,
          right: 0,
          child: Container(
            height: ScreenSize.screenHeight(context) * 0.45,
            width: ScreenSize.screenWidth(context) * 0.4,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.75,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}