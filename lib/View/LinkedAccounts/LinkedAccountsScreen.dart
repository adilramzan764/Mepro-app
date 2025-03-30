import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Images/MyImages.dart';

import '../../res/Colors/Colors.dart';
import '../../res/const/ScreenSize.dart';


class LinkedAccountsScreen extends StatelessWidget {
  const LinkedAccountsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> accounts = const [
    {
      'iconUrl': MyImageClass.google,
      'name': 'Google',
      'status': 'Connected',
      'isConnected': true,
    },
    {
      'iconUrl': MyImageClass.apple,
      'name': 'Apple',
      'status': 'Connected',
      'isConnected': true,
    },
    {
      'iconUrl': MyImageClass.facebook,
      'name': 'Facebook',
      'status': 'Connect',
      'isConnected': false,
    },
    {
      'iconUrl': MyImageClass.twitter,
      'name': 'Twitter',
      'status': 'Connect',
      'isConnected': false,
    },
  ];

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
                    'Linked Accounts',
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
            Expanded(
              child: ListView.builder(
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildAccountTile(
                      context,
                      iconUrl: accounts[index]['iconUrl'],
                      name: accounts[index]['name'],
                      status: accounts[index]['status'],
                      isConnected: accounts[index]['isConnected'],
                      onTap: () {
                        // Handle account connection/disconnection
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTile(
      BuildContext context, {
        required String iconUrl,
        required String name,
        required String status,
        required bool isConnected,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15)

        ),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.screenWidth(context) * 0.05,
          vertical: ScreenSize.screenHeight(context) * 0.025,
        ),
        child: Row(
          children: [
            // Account icon
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(iconUrl)

            ),

            // Account name
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  name,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Connection status
            Text(
              status,
              style: TextStyle(
                color: isConnected
                    ? AppColors.lightgreyColor
                    : AppColors.red_mainColor2,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ),
    );
  }
}
