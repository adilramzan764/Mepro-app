import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../res/Images/MyImages.dart';
import '../../res/Widgets/CustomButton.dart';
import '../../res/const/ScreenSize.dart';



class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _PasswordSetupScreenState();
}

class _PasswordSetupScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
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
                    'Secure Your Account',
                    style: TextStyle(
                      fontSize: ScreenSize.screenWidth(context) * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 8),
                  // SvgPicture.asset(
                  //   MyImageClass.lockIcon,
                  //   height: 24,
                  //   width: 24,
                  // ),
                ],
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.015),
              Text(
                'Almost there! Create a new password for your Loyalify account to keep it secure. Remember to choose a strong and unique password',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.04),
              Text(
                'New Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.lock_outline, color: Colors.grey)
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.03),
              Text(
                'Confirm New Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.lock_outline, color: Colors.grey)
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  // Handle password saving
                  if (_passwordController.text == _confirmPasswordController.text) {
                    // Save password logic here
                  } else {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Passwords don't match"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                text: 'Save New Password',
                isPrimary: true,
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}