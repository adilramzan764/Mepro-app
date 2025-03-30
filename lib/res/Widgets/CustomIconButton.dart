import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mepro_app/res/const/ScreenSize.dart';

import '../Colors/Colors.dart';

class CustomIconbutton extends StatelessWidget {
  Widget icon;
  String label;
  VoidCallback onPressed;
   CustomIconbutton({super.key, required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return             Container(
      height: ScreenSize.screenHeight(context) * 0.06,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          label,
          style: TextStyle(
            fontSize: ScreenSize.screenHeight(context) * 0.018,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red_mainColor2,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    )
    ;
  }
}
