import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/res/Widgets/CustomButton.dart';
import 'package:mepro_app/res/const/ScreenSize.dart';
import 'dart:math' as math;

import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';
import '../../res/Widgets/CustomPointsEarnedDialog.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  final int points;
  final double amount;
  final bool isCashingPointsScreen;

  const SelectPaymentMethodScreen({
    Key? key,
    required this.points,
    required this.amount,
    required this.isCashingPointsScreen,
  }) : super(key: key);

  @override
  State<SelectPaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<SelectPaymentMethodScreen> {
  int selectedPaymentMethod = 3; // Default to Mastercard (index 3)

  // Payment method options with their properties
  final List<Map<String, dynamic>> paymentMethods = [
    {
      'name': 'PayPal',
      'icon': MyImageClass.paypal,
      'isSvg': true,
    },
    {
      'name': 'Google Pay',
      'icon': MyImageClass.google,
      'isSvg': true,
    },
    {
      'name': 'Apple Pay',
      'icon': MyImageClass.apple,
      'isSvg': true,
    },
    {
      'name': '---- ---- ---- 5678',
      'icon': MyImageClass.mastercard,
      'isSvg': true,
    },
    {
      'name': '---- ---- ---- 5878',
      'icon': MyImageClass.visa,
      'isSvg': true,
    },
    {
      'name': '---- ---- ---- 5667',
      'customIcon': Icon(Icons.payment, color: Colors.white),
      'color': Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.screenBackgroundColor,
        title: Center(
          child: Text(
            widget.isCashingPointsScreen ? 'Cashing to' : 'Select Payment Method',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: ScreenSize.screenWidth(context) * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: AppColors.blackColor),
            onPressed: () {
              // Add new payment method
              Get.toNamed(RoutesName.addNewPaymentScreen);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = paymentMethods[index];
                  final bool isSelected = selectedPaymentMethod == index;

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: isSelected
                          ? Border.all(
                              color: AppColors.red_mainColor2, width: 1)
                          : null,
                    ),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: method['color'] ?? Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: method['isSvg'] == true
                            ? Center(
                                child: SvgPicture.asset(
                                  method['icon'],
                                  width: 30,
                                  height: 30,
                                ),
                              )
                            : method['customIcon'],
                      ),
                      title: Text(
                        method['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isSelected)
                            Icon(
                              Icons.check,
                              color: AppColors.red_mainColor2,
                            ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          selectedPaymentMethod = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    bottom: ScreenSize.screenHeight(context) * 0.04, top: 10),
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: CustomButton(
                    text:
                        'Confirm Payment (${widget.points.toInt()} pts - \$${widget.amount.toStringAsFixed(2)})',
                    isPrimary: true,
                  onPressed: () {
                    if (widget.isCashingPointsScreen) {

                      Get.toNamed(
                        RoutesName.reviewSummaryScreen,
                        arguments: {
                          'pointsAmount': widget.points,
                          'cashingAmount': widget.amount,
                          'cardNumber': paymentMethods[selectedPaymentMethod]['name'],
                          'cardIcon': paymentMethods[selectedPaymentMethod]['icon'],
                        },
                      );
                    } else {
                      showCustomPointsEarnedDialog(
                        context,
                        widget.points, // Example points amount
                        'Your rewards wishlist just got a whole lot closer! Get ready to treat yourself',
                        RoutesName.homeScreen, // Replace with your next screen route
                        'Purchased',
                      );
                    }
                  })),
          ],
        ),
      ),
    );
  }
}
