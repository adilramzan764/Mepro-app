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
            suffixIcon: label=='Birthdate' ? IconButton(
              icon: Icon(Icons.calendar_today_outlined,color: AppColors.lightgreyColor),
              onPressed: () => showDatePicker(
                context: context,
                initialDate: DateTime(1995, 12, 25),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              ).then((picked) {
                if (picked != null) {
                  controller.text = "${picked.month}/${picked.day}/${picked.year}";
                }
              }),
            ) : null,
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

