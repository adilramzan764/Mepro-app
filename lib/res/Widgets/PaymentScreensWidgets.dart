// Custom input formatters for card number and expiry date
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../View/MeproTierScreen/MeproTierScreen.dart';
import '../Colors/Colors.dart';
import '../Images/MyImages.dart';

Widget BuildPaymentWidget(
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


Widget BuildPayementMethodTextField({
  required TextEditingController controller,
  required String label,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
  List<TextInputFormatter>? inputFormatters,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            color: Color(0xff626262),
            fontSize: 12,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 5),
      TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.lightgreyColor),
          filled: true,
          fillColor: Color(0xffFAFAFA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
        ),
      ),
    ],
  );
}

Widget BuildPaymentLogos() {
  final logos = [
    MyImageClass.mastercard,
    MyImageClass.visa,
    MyImageClass.amazon,
    MyImageClass.jcb,

  ];

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: logos.map((logo) => Padding(
      padding:  EdgeInsets.only(right: 8.0),
      child: SvgPicture.asset(
        logo,
        height: 35,
        width: 60,
        fit: BoxFit.contain,
      ),
    )).toList(),
  );
}


class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i != text.length - 1) {
        buffer.write(' ');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
  }
}


class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), ''); // Allow only digits

    if (text.length > 4) {
      return oldValue; // Prevent entering more than 4 digits
    }

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 2) {
        buffer.write('/'); // Insert '/' after MM
      }
      buffer.write(text[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}