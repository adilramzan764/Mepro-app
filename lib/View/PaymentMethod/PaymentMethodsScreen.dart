import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/res/Colors/Colors.dart';
import 'package:mepro_app/res/Widgets/CustomButton.dart';

import '../../res/Images/MyImages.dart';
import '../../res/Widgets/PaymentScreensWidgets.dart';
import '../../res/const/ScreenSize.dart';

class PaymentMethodsScreen extends StatelessWidget {
   PaymentMethodsScreen({super.key});
  final List<Map<String, dynamic>> accounts = const [
    {
      'iconUrl': MyImageClass.google,
      'name': 'Google Pay',
      'status': 'Connected',
      'isConnected': true,
    },
    {
      'iconUrl': MyImageClass.apple,
      'name': 'Apple Pay',
      'status': 'Connected',
      'isConnected': true,
    },
    {
      'iconUrl': MyImageClass.paypal,
      'name': 'PayPal',
      'status': 'Connected',
      'isConnected': true,
    },
    {
      'iconUrl': MyImageClass.mastercard,
      'name': '---- ---- ---- 4568',
      'status': 'Connected',
      'isConnected': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(child:
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: AppColors.blackColor, size: screenWidth * 0.06),
                ),
                Text(
                  'Payment Methods',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: screenWidth * 0.08),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BuildPaymentWidget(
                    context,
                    iconUrl: accounts[index]['iconUrl'],
                    name: accounts[index]['name'],
                    status: accounts[index]['status'],
                    isConnected: accounts[index]['isConnected'],
                    onTap: () {
                      // Handle account connection/disconnection
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            height: screenHeight * 0.1,
            color: AppColors.whiteColor,
            padding: EdgeInsets.symmetric(vertical: screenHeight *0.023,horizontal: screenWidth* 0.1),
            child: CustomButton(text: 'Add New Payment', isPrimary: true, onPressed: (){
              Get.toNamed(RoutesName.addNewPaymentScreen);
            }),
          )


        ],
      )
      ),
    );
  }

}
