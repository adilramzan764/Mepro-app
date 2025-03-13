import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import '../const/ScreenSize.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.isPrimary,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenSize.screenHeight(context) * 0.06,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: isPrimary ? Colors.white : AppColors.red_mainColor2,
          backgroundColor: isPrimary ? AppColors.red_mainColor2 : AppColors.lightbuttoncolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: ScreenSize.screenWidth(context) * 0.045,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
