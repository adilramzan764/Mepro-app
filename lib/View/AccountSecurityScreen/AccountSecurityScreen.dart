import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AccountSecurityScreen_Controller.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Widgets/AccountAllScreens_Widgets.dart';
import '../../res/const/ScreenSize.dart';

class AccountSecurityScreen extends StatelessWidget {
  final AccountSecurityController controller = Get.put(AccountSecurityController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                    'Account & Security',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.08),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                children: [
                  _buildSecurityToggleSection('Biometric ID', controller.biometricIdEnabled, screenWidth),
                  _buildSecurityToggleSection('Face ID', controller.faceIdEnabled, screenWidth),
                  _buildSecurityToggleSection('SMS Authenticator', controller.smsAuthenticatorEnabled, screenWidth),
                  _buildSecurityToggleSection('Google Authenticator', controller.googleAuthenticatorEnabled, screenWidth),
                  _buildSecurityActionSection('Change Password', onTap: () {}),
                  _buildSecurityActionSection(
                    'Device Management',
                    subtitle: 'Manage your account on the various devices you own.',
                    onTap: () {},
                  ),
                  _buildSecurityActionSection(
                    'Deactivate Account',
                    subtitle: 'Temporarily deactivate your account. Easily reactivate when you are ready.',
                    onTap: () {},
                  ),
                  _buildDeleteAccountSection(screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityToggleSection(String title, RxBool value, double screenWidth) {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: AppColors.blackColor, fontSize: screenWidth * 0.04)),
          BuildCustomSwitch(
            value: value.value,
            onChanged: (bool newValue) => value.value = newValue,
            context: Get.context!,
          ),
        ],
      ),
    ));
  }

  Widget _buildSecurityActionSection(String title, {String? subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: AppColors.blackColor, fontSize: 16)),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  subtitle,
                  style: TextStyle(color: AppColors.lightgreyColor, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteAccountSection(double screenWidth) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delete Account',
              style: TextStyle(
                color: AppColors.red_mainColor,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'Permanently remove your account and data. Proceed with caution.',
                style: TextStyle(
                  color: AppColors.lightgreyColor,
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
