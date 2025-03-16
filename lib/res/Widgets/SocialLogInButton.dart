import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Colors/Colors.dart';
import '../Images/MyImages.dart';
import '../const/ScreenSize.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String? svg;
  final bool isSvg;
  final IconData? assetIcon;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key, // Fixed: Added key
    required this.text, // Fixed: Assigned parameters correctly
     this.svg,
    required this.isSvg,
    this.assetIcon, // Fixed: Made it nullable since it's optional
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenSize.screenHeight(context) * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightgreyColor.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed, // Fixed: Use the onPressed callback
        style: TextButton.styleFrom(
          foregroundColor: Colors.black87,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isSvg
                ? Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                                svg ?? '',
                                height: ScreenSize.screenHeight(context) * 0.025,
                              ),
                )
                : Icon(
              assetIcon ?? Icons.help, // Fixed: Added default icon if null
              size: ScreenSize.screenHeight(context) * 0.025,
              color: _getIconColor(text),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: ScreenSize.screenWidth(context) * 0.04,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(width: ScreenSize.screenWidth(context) * 0.04),

          ],
        ),
      ),
    );
  }

  Color _getIconColor(String text) {
    if (text.contains("Google")) {
      return Colors.red;
    } else if (text.contains("Apple")) {
      return Colors.black;
    } else if (text.contains("Facebook")) {
      return Colors.blue;
    } else if (text.contains("Twitter")) {
      return Colors.lightBlue;
    }
    return Colors.grey;
  }
}

class CustomGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomGoogleButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenSize.screenHeight(context) * 0.06,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey[300]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              MyImageClass.google,
              height: ScreenSize.screenWidth(context) * 0.05,
            ),
            SizedBox(width: ScreenSize.screenWidth(context) * 0.02),
            Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontSize: ScreenSize.screenWidth(context) * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
