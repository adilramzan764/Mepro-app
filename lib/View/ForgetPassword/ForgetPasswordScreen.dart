import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';

import '../../res/Images/MyImages.dart';
import '../../res/Widgets/CustomButton.dart';
import '../../res/const/ScreenSize.dart';



class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController(text: 'andrew.ainsley@yourdomain.com');


  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.screenWidth(context) * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

            // Header with key icon
            Row(
              children: [
                Text(
                  'Forgot Your Password? ',
                  style: TextStyle(
                    fontSize: ScreenSize.screenWidth(context) * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SvgPicture.asset(
                  MyImageClass.key,
                  height: ScreenSize.screenWidth(context) * 0.07,
                  colorFilter: ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                ),
              ],
            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

            // Explanation text
            Text(
              "We've got you covered. Enter your registered email to reset your password. We will send an OTP code to your email for the next steps.",
              style: TextStyle(
                fontSize: ScreenSize.screenWidth(context) * 0.04,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.05),

            // Email Field Label
            Text(
              'Your Registered Email',
              style: TextStyle(
                fontSize: ScreenSize.screenWidth(context) * 0.04,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.01),

            // Email Field
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenSize.screenHeight(context) * 0.02,
                    horizontal: ScreenSize.screenWidth(context) * 0.04,
                  ),
                ),
              ),
            ),

            // Spacer to push button to bottom
            Spacer(),

            // Send OTP Button
            CustomButton(
              onPressed: () {
                // Handle OTP sending
                if (_emailController.text.isNotEmpty) {
                  // Implement your OTP sending logic here
                  Get.toNamed(RoutesName.oTPCodeScreen);

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your email')),
                  );
                }
              },
              text: 'Send OTP Code', isPrimary: true,

            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.05),
          ],
        ),
      ),
    );
  }
}

