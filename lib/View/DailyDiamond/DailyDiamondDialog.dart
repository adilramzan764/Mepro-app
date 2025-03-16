import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/res/Widgets/CustomButton.dart';
import 'package:mepro_app/res/const/ScreenSize.dart';

import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';

class DailyDiamondDialog extends StatelessWidget {
  const DailyDiamondDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            // Diamond Icon
            Container(
              width: ScreenSize.screenWidth(context) * 0.18,
              height: ScreenSize.screenHeight(context) * 0.1,
              decoration: const BoxDecoration(
                color: AppColors.red_mainColor2,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  MyImageClass.diamondIcon,
                  width: ScreenSize.screenWidth(context) * 0.04,
                  height: ScreenSize.screenHeight(context) * 0.04,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Title
             Text(
              'Daily Diamond Reminder!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
             SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
            // Description
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Don't Miss Out! Grab Your Daily Diamond & Watch Your Points Grow!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ScreenSize.screenHeight(context) * 0.018,
                  color: AppColors.lightgreyColor,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Get Diamond Button
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.1),
              child: CustomButton(text: 'Get Diamond', isPrimary: true, onPressed: (){
                Navigator.of(context).pop(true);
                Get.toNamed(RoutesName.dailyDiamondScreen);
              }),
            ),
            const SizedBox(height: 16),
            // Maybe Later Button
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.1),
              child: CustomButton(text: 'Maybe Later', isPrimary: false, onPressed: (){
                Navigator.of(context).pop(false);

              }),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// Helper function to show the dialog
Future<bool?> showDailyDiamondDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const DailyDiamondDialog();
    },
  );
}

// Example usage
void showDiamondReminder(BuildContext context) async {
  final result = await showDailyDiamondDialog(context);
  if (result == true) {
    // User clicked "Get Diamond"
    // Add your logic here
  } else {
    // User clicked "Maybe Later"
    // Add your logic here
  }
}