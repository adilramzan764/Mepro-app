import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';

import '../Colors/Colors.dart';
import '../Images/MyImages.dart';
import '../const/ScreenSize.dart';

/// Reminder Banner
Widget BuildReminderBanner(double screenWidth, double screenHeight) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: screenHeight * 0.02),
    padding: EdgeInsets.all(screenWidth * 0.04),
    decoration: BoxDecoration(
      color: AppColors.red_mainColor2,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      children: [
        // Diamond icon
        Container(
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              MyImageClass.diamondIcon,
              width: screenWidth * 0.06,
              height: screenWidth * 0.06,
              color: AppColors.red_mainColor,
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.04),

        // Reminder text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daily Diamond Reminder!',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                'Don\'t Miss Out! Stamp & Score Points Today!',
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        // Arrow icon
        const Icon(
          Icons.chevron_right,
          color: Colors.white,
          size: 24,
        ),
      ],
    ),
  );
}

/// Points Card
Widget BuildPointsCard(double screenWidth, double screenHeight) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: screenHeight * 0.02),
    padding: EdgeInsets.all(screenWidth * 0.04),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        // Diamond badge
        Image.asset(
          MyImageClass.silver,
          width: screenWidth * 0.12,
          height: screenWidth * 0.12,
        ),
        SizedBox(width: screenWidth * 0.04),

        // Points info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Points',
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                '249,560',
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),

        // Arrow icon
        const Icon(
          Icons.chevron_right,
          color: Colors.grey,
          size: 24,
        ),
      ],
    ),
  );
}

/// Menu Item
Widget BuildMenuCard(BuildContext context, IconData icon, String title) {
  final double screenWidth = ScreenSize.screenWidth(context);
  final double screenHeight = ScreenSize.screenHeight(context);

  return Container(
    height: screenHeight * 0.066,
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.black54,
        size: screenWidth * 0.055,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.041,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
        size: 24,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // No vertical padding

    ),
  );
}