import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Colors/Colors.dart';
import 'package:mepro_app/res/Widgets/CustomButton.dart';

import '../../res/const/ScreenSize.dart';

enum ThemeOption {
  systemDefault,
  light,
  dark,
}

class ThemeSelectionBottomSheet extends StatefulWidget {
  final ThemeOption initialTheme;
  final Function(ThemeOption) onThemeSelected;

  const ThemeSelectionBottomSheet({
    Key? key,
    required this.initialTheme,
    required this.onThemeSelected,
  }) : super(key: key);

  @override
  _ThemeSelectionBottomSheetState createState() =>
      _ThemeSelectionBottomSheetState();
}

class _ThemeSelectionBottomSheetState extends State<ThemeSelectionBottomSheet> {
  late ThemeOption _selectedTheme;

  @override
  void initState() {
    super.initState();
    _selectedTheme = widget.initialTheme;
  }

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
          // Handle indicator
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              'Choose Theme',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(height: 1,color: Colors.grey.withOpacity(0.3),),
          ),

          SizedBox(height: ScreenSize.screenHeight(context) * 0.03,),

          // System Default option
          _buildThemeOption(
            title: 'System Default',
            value: ThemeOption.systemDefault,
          ),
          SizedBox(height: ScreenSize.screenHeight(context) * 0.025,),
          // Light option
          _buildThemeOption(
            title: 'Light',
            value: ThemeOption.light,
          ),
          SizedBox(height: ScreenSize.screenHeight(context) * 0.025,),

          // Dark option
          _buildThemeOption(
            title: 'Dark',
            value: ThemeOption.dark,
          ),
          SizedBox(height: ScreenSize.screenHeight(context) * 0.03,),

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
                  child: CustomButton(text: 'Cancel', isPrimary: false, onPressed: (){
                    Get.back();
                  }),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomButton(text: 'OK', isPrimary: true, onPressed: (){
                    Get.back();

                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption({
    required String title,
    required ThemeOption value,
  }) {
    final isSelected = _selectedTheme == value;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedTheme = value;
        });
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24, ),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.red_mainColor2 : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.red_mainColor2,
                ),
              )
                  : null,
            ),
            SizedBox(width: ScreenSize.screenWidth(context) * 0.03),
            Text(
              title,
              style: TextStyle(
                fontSize: ScreenSize.screenHeight(context) * 0.018,
                color: AppColors.blackColor,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }
}

