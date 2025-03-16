import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../View/MeproTierScreen/MeproTierScreen.dart';
import '../Colors/Colors.dart';

Widget buildInputField(BuildContext context, String label, TextEditingController controller, {IconData? icon, bool isPhone = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: ScreenSize.screenWidth(context) * 0.04,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
      ),
      SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
      Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: controller,
          keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            prefixIcon: icon != null ? Icon(icon, color: AppColors.lightgreyColor) : null,
          ),
        ),
      ),
      SizedBox(height: ScreenSize.screenHeight(context) * 0.03),
    ],
  );
}

Widget buildDropdownField(BuildContext context, String label, List<String> options, String value, Function(String) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: ScreenSize.screenWidth(context) * 0.04, fontWeight: FontWeight.w500, color: AppColors.blackColor),
      ),
      SizedBox(height: ScreenSize.screenHeight(context) * 0.01),
      DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none), contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14)),
        items: options.map((String option) {
          return DropdownMenuItem<String>(value: option, child: Text(option));
        }).toList(),
        onChanged: (newValue) => onChanged(newValue!),
      ),
      SizedBox(height: ScreenSize.screenHeight(context) * 0.03),
    ],
  );
}

Widget buildDateField(BuildContext context, String label, TextEditingController controller, Function(BuildContext) onTap) {
  return buildInputField(context, label, controller, icon: Icons.calendar_today_outlined);
}