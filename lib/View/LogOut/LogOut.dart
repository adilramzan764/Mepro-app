import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/res/Colors/Colors.dart';

import '../../res/Widgets/CustomButton.dart';
import '../../res/const/ScreenSize.dart';

class LogOut_BottomSheet extends StatelessWidget {
  const LogOut_BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              'LogOut',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenSize.screenHeight(context) * 0.022,
                fontWeight: FontWeight.w500,
                color: AppColors.red_mainColor2
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(height: 1,color: Colors.grey.withOpacity(0.3),),
          ),

          SizedBox(height: ScreenSize.screenHeight(context) * 0.025,),
          Text('Are you sure you want to log out?',style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: ScreenSize.screenHeight(context) * 0.02
          ),
          textAlign: TextAlign.center,),
          SizedBox(height: ScreenSize.screenHeight(context) * 0.025,),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(height: 1,color: Colors.grey.withOpacity(0.3),),
          ),

          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: ScreenSize.screenHeight(context) * 0.05,

                    child: CustomButton(text: 'Cancel', isPrimary: false, onPressed: (){
                      Get.back();
                    }),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: ScreenSize.screenHeight(context) * 0.05,
                    child: CustomButton(text: 'Yes, LogOut', isPrimary: true, onPressed: (){
                      Get.offAllNamed(RoutesName.signInscreen);

                    }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenSize.screenHeight(context) * 0.01,),

        ],
      ),
    );
  }
}
