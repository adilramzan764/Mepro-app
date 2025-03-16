import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';
import '../../res/Widgets/AccountScreen_Widgets.dart';
import '../../res/const/ScreenSize.dart';
import '../DailyDiamond/DailyDiamondDialog.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = ScreenSize.screenWidth(context);
    final double screenHeight = ScreenSize.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  SizedBox(
                    height: screenHeight * 0.03,
                    width: screenWidth * 0.15,
                    child: SvgPicture.asset(
                      'assets/Logo Mepro.svg',
                      color: AppColors.red_mainColor,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Title
                  Text(
                    'Account',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // QR Code Icon
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.02),
                    child: SvgPicture.asset(MyImageClass.qrcode),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.015,
                ),
                child: Column(
                  children: [
                    // Daily Diamond Reminder Banner
                    InkWell(
                        onTap: (){
                          showDiamondReminder(context);

                        },
                        child: BuildReminderBanner(screenWidth, screenHeight)),

                    // Points card
                    InkWell(
                        onTap: (){
                          Get.toNamed(RoutesName.meproTierScreen);
                        },
                        child: BuildPointsCard(screenWidth, screenHeight)),

                    // Account menu items
                    InkWell(
                        onTap: (){
                          Get.toNamed(RoutesName.myProfileScreen);
                        },
                        child: BuildMenuCard(context, Icons.person_outline, 'My Profile')),
                    InkWell(
                        onTap: (){
                          Get.toNamed(RoutesName.notificationSettings_Screen);

                        },
                        child: BuildMenuCard(context, Icons.notifications_none, 'Notifications')),
                    BuildMenuCard(context, Icons.shield_outlined, 'Account & Security'),
                    BuildMenuCard(context, Icons.credit_card_outlined, 'Payment Methods'),
                    BuildMenuCard(context, Icons.sync_alt, 'Linked Accounts'),
                    BuildMenuCard(context, Icons.remove_red_eye_outlined, 'App Appearance'),
                    BuildMenuCard(context, Icons.analytics_outlined, 'Data & Analytics'),
                    BuildMenuCard(context, Icons.help_outline, 'Help & Support'),

                    // Logout option
                    Container(
                      height: screenHeight * 0.066,

                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: AppColors.red_mainColor,
                          size: screenWidth * 0.055,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: screenWidth * 0.041,
                            color: AppColors.red_mainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                        ),
                        onTap: () {
                          // Handle logout action
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
