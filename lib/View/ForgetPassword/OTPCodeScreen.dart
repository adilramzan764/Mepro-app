import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mepro_app/res/Colors/Colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

import '../../Controller/OtpVerificationController.dart';
import '../../Routes/RoutesName.dart';
import '../../res/Widgets/CustomButton.dart';
import '../../res/const/ScreenSize.dart';




class OTPCodeScreen extends StatelessWidget {
  final OtpVerificationController controller = Get.put(OtpVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
            Row(
              children: [
                Text(
                  'Enter OTP Code ',
                  style: TextStyle(
                    fontSize: ScreenSize.screenWidth(context) * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                // SvgPicture.asset(
                //   MyImageClass.lockIcon,
                //   height: ScreenSize.screenWidth(context) * 0.07,
                //   colorFilter: ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                // ),
              ],
            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
            Text(
              "Please check your email inbox for a message from Loyalify. Enter the one-time verification code below.",
              style: TextStyle(
                fontSize: ScreenSize.screenWidth(context) * 0.04,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.05),
            PinCodeTextField(
              length: 4,
              appContext: context,
              onChanged: (value) => controller.otpValue.value = value,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: ScreenSize.screenWidth(context) * 0.15,
                fieldWidth: ScreenSize.screenWidth(context) * 0.15,
                activeFillColor: Colors.white,
                selectedColor: AppColors.red_mainColor2,
                inactiveColor: Colors.grey.shade300,
              ),
            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.04),
            Center(
              child: Obx(() => Column(
                children: [
                  Text(
                    'You can resend the code in ${controller.remainingSeconds.value} seconds',
                    style: TextStyle(
                      fontSize: ScreenSize.screenWidth(context) * 0.035,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
                  GestureDetector(
                    onTap: controller.remainingSeconds.value == 0 ? controller.resetTimer : null,
                    child: Text(
                      'Resend code',
                      style: TextStyle(
                        fontSize: ScreenSize.screenWidth(context) * 0.035,
                        color: controller.remainingSeconds.value == 0 ? Colors.redAccent : Colors.grey[400],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )),
            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.08),
            CustomButton(
              onPressed: () {
                // Handle OTP sending
                Get.toNamed(RoutesName.newPasswordScreen);

              },
              text: 'Verify', isPrimary: true,

            ),


          ],
        ),
      ),
    );
  }
}
