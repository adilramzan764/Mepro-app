import 'package:flutter/material.dart';
import 'package:mepro_app/res/Colors/Colors.dart';
import 'package:mepro_app/res/Widgets/CustomSettings_AppBar.dart';

import '../../res/Images/MyImages.dart';
import '../../res/Widgets/HomeScreen_Widgets.dart';
import '../../res/const/ScreenSize.dart';

class PromoRewadsScreen extends StatelessWidget {
  const PromoRewadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          CustomSettings_AppBar(screenName: 'Promo & Rewads'),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.screenWidth(context) * 0.05,
              ),
              children: const [
                RewardItem(
                  image: MyImageClass.reward_starbucks,
                  title: 'Get Free 1 Cup Coffee E-Voucher',
                  points: 3750,
                  merchantName: 'Starbucks',
                ),
                SizedBox(height: 16),
                RewardItem(
                  image: MyImageClass.reward_mcdonalds,
                  title: 'Get Free Burger',
                  points: 9500,
                  merchantName: 'McDonald\'s',
                ),
                SizedBox(height: 16),
                RewardItem(
                  image: MyImageClass.reward_cocacla,
                  title: 'Get 1 Free Bottle of Coca-Cola E-Voucher',
                  points: 5000,
                  merchantName: 'Coca-Cola',
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
