import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Colors/Colors.dart';
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
