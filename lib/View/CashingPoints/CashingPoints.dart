import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/CashingPointsController.dart';
import '../../Routes/RoutesName.dart';
import '../../res/Colors/Colors.dart';
import '../../res/const/ScreenSize.dart';

class CashingPointsScreen extends StatelessWidget {
  final CashingPointsController controller = Get.put(CashingPointsController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSizeMultiplier = screenWidth / 375;

    return Scaffold(
      backgroundColor: AppColors.red_mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.red_mainColor,
        elevation: 0,
        title: Center(
          child: Text(
            'Cashing Points',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 18 * fontSizeMultiplier,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
          onPressed: () => Get.back(),
        ),
        actions: [SizedBox(width: 30)],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter amount of points you want to cashing.',
                        style: TextStyle(color: AppColors.whiteColor, fontSize: 16 * fontSizeMultiplier),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Obx(() => Text(
                        controller.enteredPoints.value,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 48 * fontSizeMultiplier,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        'Available points: ${controller.availablePoints}',
                        style: TextStyle(color: AppColors.whiteColor, fontSize: 14 * fontSizeMultiplier),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Obx(() => Text(
                        '${controller.enteredPoints.value} points equals \$${controller.calculatedAmount.toStringAsFixed(2)}',
                        style: TextStyle(color: AppColors.whiteColor, fontSize: 14 * fontSizeMultiplier),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Container(
                  width: double.infinity,
                  child: Obx(() => ElevatedButton(
                    onPressed: int.parse(controller.enteredPoints.value) > 0
                        ? () {
                      Get.toNamed(RoutesName.selectPaymentMethodScreen, arguments: {
                        'amount': controller.calculatedAmount,
                        'points': int.parse(controller.enteredPoints.value),
                        'isCashingPointsScreen': true,
                      });
                    }
                        : () {
                      ScaffoldMessenger.of(Get.context!).showSnackBar(
                        SnackBar(
                          content: Text('Please enter a valid amount of points.'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.whiteColor,
                      foregroundColor: AppColors.red_mainColor,
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 16 * fontSizeMultiplier, fontWeight: FontWeight.w600),
                    ),
                  )),
                ),
              ),
              Container(
                color: AppColors.whiteColor,
                padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                child: Column(
                  children: [
                    _buildNumberRow(['1', '2', '3'], screenWidth),
                    _buildNumberRow(['4', '5', '6'], screenWidth),
                    _buildNumberRow(['7', '8', '9'], screenWidth),
                    _buildNumberRow(['*', '0', 'backspace'], screenWidth),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNumberRow(List<String> values, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: values.map((value) {
        if (value == 'backspace') {
          return _buildKeypadButton(
            child: Icon(Icons.backspace_outlined, color: AppColors.blackColor),
            onTap: controller.backspace,
            screenWidth: screenWidth,
          );
        } else if (value == '*') {
          return _buildKeypadButton(
            child: Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
            onTap: controller.clear,
            screenWidth: screenWidth,
          );
        } else {
          return _buildKeypadButton(
            child: Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
            onTap: () => controller.addDigit(value),
            screenWidth: screenWidth,
          );
        }
      }).toList(),
    );
  }

  Widget _buildKeypadButton({required Widget child, required VoidCallback onTap, required double screenWidth}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: screenWidth / 3.5,
        height: 60,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
