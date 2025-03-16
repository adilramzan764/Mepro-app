import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../res/Images/MyImages.dart';
import '../../res/Widgets/CustomButton.dart';
import '../../res/Widgets/CustomTextField.dart';
import '../../res/Widgets/SocialLogInButton.dart';
import '../../res/const/ScreenSize.dart';
import '../SignIn/SignInScreen.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _agreeToTerms = false;


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();


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
                    'Join Mepro Today',
                    style: TextStyle(
                      fontSize: ScreenSize.screenWidth(context) * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: ScreenSize.screenWidth(context) * 0.03),
                  Icon(
                    Icons.person,
                    color: Colors.blueGrey[300],
                    size: ScreenSize.screenWidth(context) * 0.08,
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
              Text(
                'Unlock Rewards, Start Earning Now!',
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
              SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

              // Referral Code Field
              Text(
                'Referral Code (optional)',
                style: TextStyle(
                  fontSize: ScreenSize.screenWidth(context) * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
              CustomTextField(
                controller: referralController,
                hintText: 'Referral Code (optional)',
              ),              SizedBox(height: ScreenSize.screenHeight(context) * 0.03),

              // Terms and Conditions Checkbox
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value ?? false;
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
                    'I agree to Loyalify ',
                    style: TextStyle(
                      fontSize: ScreenSize.screenWidth(context) * 0.035,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Terms & Conditions
                    },
                    child: Text(
                      'Terms & Conditions.',
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

              // Already have an account text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: ScreenSize.screenWidth(context) * 0.035,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign In screen
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: ScreenSize.screenWidth(context) * 0.035,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

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
              SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

              // Google Sign In Button
              CustomGoogleButton(
                onPressed: () {
                  // Handle Google sign in
                },
                text: 'Continue with Google',
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.03),

              // Sign Up Button
              CustomButton(
                onPressed: () {
                  // Handle sign up
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                text: 'Sign up', isPrimary: true,
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}


