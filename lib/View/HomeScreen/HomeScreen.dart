import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Routes/RoutesName.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';
import '../../res/Widgets/HomeScreen_Widgets.dart';
import '../../res/Widgets/Onboarding_Widgets.dart';
import '../../res/const/ScreenSize.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: ScreenSize.screenHeight(context) * 0.5,
                decoration: BoxDecoration(
                  color: AppColors.red_mainColor,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: ScreenSize.screenHeight(context) * 0.01),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.screenWidth(context) * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        MyImageClass.logo,
                        height: 24,
                        color: Colors.white,
                      ),
                      const Text(
                        'Mepro',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.toNamed(RoutesName.notificationScreen);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              MyImageClass.bellIcon,
                              height: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.screenHeight(context) * 0.015),
                  
                        // Points and Diamond card
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenSize.screenWidth(context) * 0.05,
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              // Points
                              Image.asset(
                                MyImageClass.silver,
                                width: 32,
                                height: 32,
                              ),
                              SizedBox(width: ScreenSize.screenWidth(context) * 0.03,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Your Points',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF808080),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        SvgPicture.asset(
                                          MyImageClass.pointsIcon,
                                          height: 16,
                                          color: Color(0xFFFA5D75),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      '1500.00',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF404040),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                  
                              // Diamond
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Your Diamond',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF808080),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        SvgPicture.asset(
                                          MyImageClass.diamondIcon,
                                          height: 16,
                                          color: Color(0xFFFA5D75),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Padding(
                                      padding:  EdgeInsets.only(left: ScreenSize.screenWidth(context) * 0.05  ),
                                      child: const Text(
                                        '150',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF404040),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                  
                              // Arrow
                              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
                            ],
                          ),
                        ),
                        // Action buttons
                        SizedBox(height: ScreenSize.screenHeight(context) * 0.015),
                  
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenSize.screenWidth(context) * 0.05,
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              // First row of actions
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ActionItem(
                                    icon: MyImageClass.receiptIcon,
                                    label: 'Receipt Photo',
                                    onTap: () {
                                      Get.toNamed(RoutesName.receiptPhotoScreen);
                                    },
                                  ),
                                  ActionItem(
                                    icon: MyImageClass.surveyIcon,
                                    label: 'Survey',
                                    onTap: () {
                                      Get.toNamed(RoutesName.surveyScreen);

                                    },
                                  ),
                                  ActionItem(
                                    icon: MyImageClass.qrCodeIcon,
                                    label: 'Scan QR Code',
                                    onTap: () {
                                      Get.toNamed(RoutesName.qRScannerScreen);
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: ScreenSize.screenHeight(context) * 0.03),
                              // Second row of actions
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ActionItem(
                                    icon: MyImageClass.buyPointsIcon,
                                    label: 'Buy Points',
                                    onTap: () {
                                      Get.toNamed(RoutesName.buyPointsScreen);

                                    },
                                  ),
                                  ActionItem(
                                    icon: MyImageClass.inviteFriendsIcon,
                                    label: 'Invite Friends',
                                    onTap: () {
                                      Get.toNamed(RoutesName.inviteFriendsScreen);

                                    },
                                  ),
                                  ActionItem(
                                    icon: MyImageClass.cashingPointsIcon,
                                    label: 'Cashing Points',
                                    onTap: () {
                                      Get.toNamed(RoutesName.cashingPointsScreen);

                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  
                        SizedBox(height: ScreenSize.screenHeight(context) * 0.015),
                  
                        // Popular Merchants
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenSize.screenWidth(context) * 0.05,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Popular Merchants',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF404040),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Text(
                                      'View All',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFA5D75),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    SvgPicture.asset(
                                      MyImageClass.arrowRightIcon,
                                      height: 16,
                                      color: const Color(0xFFFA5D75),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  
                        SizedBox(height: ScreenSize.screenHeight(context) * 0.015),
                  
                        // Merchants list
                        SizedBox(
                          height: ScreenSize.screenHeight(context) * 0.1,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenSize.screenWidth(context) * 0.05,
                            ),
                            children: const [
                              MerchantItem(
                                image: MyImageClass.thaicorner,
                                name: 'Thai Corner',
                              ),
                              SizedBox(width: 16),
                              MerchantItem(
                                image: MyImageClass.macdonald,
                                name: 'McDonald\'s',
                              ),
                              SizedBox(width: 16),
                              MerchantItem(
                                image: MyImageClass.hermes,
                                name: 'Hermes',
                              ),
                              SizedBox(width: 16),
                              MerchantItem(
                                image: MyImageClass.burgerking,
                                name: 'Burger King',
                              ),
                              SizedBox(width: 16),
                              MerchantItem(
                                image: MyImageClass.thaicorner,
                                name: 'Thai Massage',
                              ),
                            ],
                          ),
                        ),
                  
                        SizedBox(height: ScreenSize.screenHeight(context) * 0.015),
                  
                        // Promo & Rewards
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenSize.screenWidth(context) * 0.05,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Promo & Rewards',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF404040),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesName.promoRewadsScreen);
                                },
                                child: Row(
                                  children: [
                                    const Text(
                                      'View All',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFA5D75),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    SvgPicture.asset(
                                      MyImageClass.arrowRightIcon,
                                      height: 16,
                                      color: const Color(0xFFFA5D75),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  
                        SizedBox(height: ScreenSize.screenHeight(context) * 0.015),
                  
                        // Rewards list
                        SizedBox(
                          height: ScreenSize.screenHeight(context) * 0.2,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
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
                              SizedBox(width: 16),
                              RewardItem(
                                image: MyImageClass.reward_mcdonalds,
                                title: 'Get Free Burger',
                                points: 9500,
                                merchantName: 'McDonald\'s',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}