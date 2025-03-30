import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Images/MyImages.dart';

import '../../res/Colors/Colors.dart';
import '../../res/Widgets/CustomButton.dart';
import '../../res/Widgets/PaymentScreensWidgets.dart';
import '../../res/const/ScreenSize.dart';


class AddNewPaymentScreen extends StatefulWidget {
  const AddNewPaymentScreen({Key? key}) : super(key: key);

  @override
  _AddNewPaymentScreenState createState() => _AddNewPaymentScreenState();
}

class _AddNewPaymentScreenState extends State<AddNewPaymentScreen> {
  final _cardNumberController = TextEditingController();
  final _accountHolderController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.screenWidth(context) * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  // horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(Icons.close, color: AppColors.blackColor, size: screenWidth * 0.06),
                    ),
                    Text(
                      'Add New Payment',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SvgPicture.asset(MyImageClass.scanqr,height: 20,width: 20,)
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                      SizedBox(height: 20),
                      BuildPayementMethodTextField(
                        controller: _cardNumberController,
                        label: 'Card Number',
                        hintText: '2640476375569 8456',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberFormatter(),
                        ],
                      ),
                      SizedBox(height: 15),
                      BuildPayementMethodTextField(
                        controller: _accountHolderController,
                        label: 'Account Holder Name',
                        hintText: 'Andrew Ainsley',
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: BuildPayementMethodTextField(
                              controller: _expiryDateController,
                              label: 'Expiry Date',
                              hintText: '06/28',
                              keyboardType: TextInputType.datetime,
                              inputFormatters: [ExpiryDateFormatter()],
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child: BuildPayementMethodTextField(
                              controller: _cvvController,
                              label: 'CVV',
                              hintText: '475',
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Supported Payments:',
                        style: TextStyle(
                            color: Color(0xff626262),
                          fontSize: 14,
                            fontWeight: FontWeight.bold
                
                        ),
                      ),
                      SizedBox(height: 10),
                      BuildPaymentLogos(),
                    ],
                  ),
                ),
              ),

              CustomButton(text: 'Save', isPrimary: true, onPressed: (){
                Get.back();
              }),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.03)

            ],
          ),
        ),
      ),
    );
  }





  @override
  void dispose() {
    _cardNumberController.dispose();
    _accountHolderController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}


