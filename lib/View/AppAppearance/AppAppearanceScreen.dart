import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/res/Colors/Colors.dart';
import 'package:mepro_app/res/const/ScreenSize.dart';

import '../../res/Widgets/CustomSettings_AppBar.dart';
import 'ThemeSelectionBottomSheet.dart';

class AppAppearanceScreen extends StatelessWidget {

   AppAppearanceScreen({super.key});

   void showThemeSelectionSheet(BuildContext context) {
     showModalBottomSheet(
       context: context,
       isScrollControlled: true,
       backgroundColor: Colors.transparent,
       builder: (context) => ThemeSelectionBottomSheet(
         initialTheme: ThemeOption.light, // Set your current theme here
         onThemeSelected: (selectedTheme) {
           // Handle theme change
           print('Selected theme: $selectedTheme');
         },
       ),
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(child: Column(
        children: [
          CustomSettings_AppBar(screenName: 'App Appearance',),
          // SizedBox(height: ScreenSize.screenHeight(context) * 0.01,),
          InkWell(
            onTap: (){
              showThemeSelectionSheet(context);
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.05),
              child: Row(
                children: [
                  Text('Theme',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenSize.screenHeight(context) * 0.02
                  ),),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:
                    Text('Light',style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenSize.screenHeight(context) * 0.017,
                      color: AppColors.greyColor
                    ),),
                    ),
                  ),
                  SizedBox(width: ScreenSize.screenWidth(context) * 0.04,),

                  Icon(CupertinoIcons.right_chevron,size: 16,)
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenSize.screenHeight(context) * 0.02,),

          InkWell(
            onTap: (){
              Get.toNamed(RoutesName.languageSelectionScreen);
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.05),
              child: Row(
                children: [
                  Text('App Language',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenSize.screenHeight(context) * 0.02
                  ),),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:
                    Text('English(US)',style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenSize.screenHeight(context) * 0.017,
                      color: AppColors.greyColor
                    ),),
                    ),
                  ),
                  SizedBox(width: ScreenSize.screenWidth(context) * 0.04,),

                  Icon(CupertinoIcons.right_chevron,size: 16,)
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
