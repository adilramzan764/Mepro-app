import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../View/MeproTierScreen/MeproTierScreen.dart';
import '../Colors/Colors.dart';

Widget BuildCustomSwitch({
  // required BuildContext context,
  required bool value,
  required Function(bool) onChanged,
  required BuildContext context

}) {
  double screenWidth = ScreenSize.screenWidth(context);
  double screenHeight = ScreenSize.screenHeight(context);
  return GestureDetector(
    onTap: () => onChanged(!value),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: screenWidth * 0.15,
      height: screenHeight * 0.041,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: value ? AppColors.red_mainColor : Colors.grey.shade300,
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            left: value ? 24 : 4,
            top: 4,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget BuildToogleWidget({
  required String title,
  required bool isEnabled,
  required Function(bool) onChanged,
  required BuildContext context
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: ScreenSize.screenWidth(context) * 0.04,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor.withOpacity(0.8),
            ),
          ),
        ),
        BuildCustomSwitch(
            value: isEnabled,
            onChanged: onChanged,
            context: context
        ),
      ],
    ),
  );
}