import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Widgets/CustomButton.dart';
import 'package:mepro_app/res/Widgets/CustomSettings_AppBar.dart';
import 'package:mepro_app/res/const/ScreenSize.dart';

import '../../Routes/RoutesName.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';
import '../../res/Widgets/CustomPointsEarnedDialog.dart';

class ReviewSummaryScreen extends StatelessWidget {
  final int pointsAmount;
  final double cashingAmount;
  final String cardNumber;
  final String cardIcon;

  const ReviewSummaryScreen({
    Key? key,
    this.pointsAmount = 100000,
    this.cashingAmount = 100.00,
    this.cardNumber = '5567',
    this.cardIcon = MyImageClass.mastercard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSettings_AppBar(screenName: 'Review Summary'),
            // Summary card
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.05),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSummaryRow('Points Amount', pointsAmount.toString()),
                  SizedBox(height: 16),
                  _buildSummaryRow('Cashing Conversion', '\$${cashingAmount.toStringAsFixed(2)}'),
                  SizedBox(height: 16),
                  _buildSummaryRow('Fee', 'Free'),
                  SizedBox(height: 16),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(height: 16),
                  _buildSummaryRow('You will get', '\$${cashingAmount.toStringAsFixed(2)}', isTotal: true),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Cashing to section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.05),
              child: Text(
                'Cashing to',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
            ),

            SizedBox(height: 16),

            // Payment method card
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.05),

              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Card logo
                  SvgPicture.asset(cardIcon),

                  SizedBox(width: 16),

                  // Card details
                  Text(
                    '${cardNumber}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Spacer(),

                  // Change button
                  TextButton(
                    onPressed: () {
                      // Navigate to payment method selection
                      Get.back();
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                        color: AppColors.red_mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),

            // Cashing Now button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.05,vertical: 20),
              child: CustomButton(text: 'Cashing Now', isPrimary: true, onPressed: (){
                showCustomPointsEarnedDialog(
                  context,
                  pointsAmount, // Example points amount
                  'Rewards just got real! This is just the beginning, keep collecting and cashing in.',
                  RoutesName.homeScreen, // Replace with your next screen route
                  ' just Cashed in',
                );
              }),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}