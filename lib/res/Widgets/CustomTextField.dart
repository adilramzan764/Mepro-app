import 'package:flutter/material.dart';
import '../../res/const/ScreenSize.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 14),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey.withOpacity(0.6)) : null,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: ScreenSize.screenHeight(context) * 0.02, horizontal: prefixIcon==null ? ScreenSize.screenWidth(context) * 0.03 : 0
          ),
        ),
      ),
    );
  }
}
