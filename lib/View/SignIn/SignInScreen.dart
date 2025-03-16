import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Widgets/CustomLoader.dart';

import '../../Routes/RoutesName.dart';
import '../../res/Images/MyImages.dart';
import '../../res/Widgets/CustomButton.dart';
import '../../res/Widgets/CustomTextField.dart';
import '../../res/Widgets/SocialLogInButton.dart';
import '../../res/const/ScreenSize.dart';
import '../ForgetPassword/ForgetPasswordScreen.dart';




class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.screenWidth(context) * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
              Row(
                children: [
                  Text(
                    'Welcome Back! ',
                    style: TextStyle(
                      fontSize: ScreenSize.screenWidth(context) * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SvgPicture.asset(
                    MyImageClass.waveEmoji,
                    height: ScreenSize.screenWidth(context) * 0.11,
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
              Text(
                'Sign in for Exclusive Rewards.',
                style: TextStyle(
                  fontSize: ScreenSize.screenWidth(context) * 0.04,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.04),

              // Email Field
              Text(
                'Email',
                style: TextStyle(
                  fontSize: ScreenSize.screenWidth(context) * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

              // Password Field
              Text(
                'Password',
                style: TextStyle(
                  fontSize: ScreenSize.screenWidth(context) * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.withOpacity(0.6),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.01),

              // Remember me and Forgot Password row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          activeColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: ScreenSize.screenWidth(context) * 0.035,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Forgot Password screen
                      Get.toNamed(RoutesName.forgotPasswordScreen);

                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: ScreenSize.screenWidth(context) * 0.035,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.04),

              // Or divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.screenWidth(context) * 0.02,
                    ),
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: ScreenSize.screenWidth(context) * 0.035,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.03),

              // Social Login Buttons
              SocialLoginButton(
                onPressed: () {
                  // Handle Google sign-in
                },
                text: 'Continue with Google',
                svg: MyImageClass.google, // Fixed: Changed `iconAsset` to `icon`
                isSvg: true, // Added: Google logo is an SVG
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

              SocialLoginButton(
                onPressed: () {
                  // Handle Apple sign-in
                },
                text: 'Continue with Apple',
                svg: "assets/icons/apple.svg",
                isSvg: false,
                assetIcon: Icons.apple, // Added: Proper Apple icon
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

              SocialLoginButton(
                onPressed: () {
                  // Handle Facebook sign-in
                },
                text: 'Continue with Facebook',
                svg: "assets/icons/facebook.svg",
                isSvg: false,
                assetIcon: Icons.facebook, // Added: Proper Facebook icon
              ),

              SizedBox(height: ScreenSize.screenHeight(context) * 0.03),

              // Sign In Button
              CustomButton(
                text: "Sign In",
                isPrimary: true,
                onPressed: () {
                  // Handle sign up
                  // CustomLoader.startLoading(loadingStatus: 'Signing In..');
                  CustomLoader.showLoadingForSigning(context);
                  // Get.toNamed(RoutesName.homeScreen);
                },
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}


