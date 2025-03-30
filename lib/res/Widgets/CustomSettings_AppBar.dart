import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Colors/Colors.dart';

class CustomSettings_AppBar extends StatelessWidget {
   String screenName;
   CustomSettings_AppBar({super.key, required this.screenName});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: AppColors.blackColor, size: screenWidth * 0.06),
          ),
          Text(
         screenName,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: screenWidth * 0.08),
        ],
      ),
    );
  }
}
