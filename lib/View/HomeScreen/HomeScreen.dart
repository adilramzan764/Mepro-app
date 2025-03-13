import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';
import '../../res/Widgets/Onboarding_Widgets.dart';
import '../../res/const/ScreenSize.dart';



class ActionItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const ActionItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBED),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
                color: const Color(0xFFFA5D75),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF404040),
            ),
          ),
        ],
      ),
    );
  }
}

class MerchantItem extends StatelessWidget {
  final String image;
  final String name;

  const MerchantItem({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 70,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF404040),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class RewardItem extends StatelessWidget {
  final String image;
  final String title;
  final int points;
  final String merchantName;

  const RewardItem({
    Key? key,
    required this.image,
    required this.title,
    required this.points,
    required this.merchantName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.screenWidth(context) * 0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF404040),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$points points',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFA5D75),
                      ),
                    ),
                    Text(
                      merchantName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                height: ScreenSize.screenHeight(context) * 0.6,
                decoration: BoxDecoration(
                  color: AppColors.red_mainColor,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
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
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
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
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

                  // Points and Diamond card
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenSize.screenWidth(context) * 0.05,
                    ),
                    padding: const EdgeInsets.all(16),
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
                  SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenSize.screenWidth(context) * 0.05,
                    ),
                    padding: const EdgeInsets.all(16),
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
                              onTap: () {},
                            ),
                            ActionItem(
                              icon: MyImageClass.surveyIcon,
                              label: 'Survey',
                              onTap: () {},
                            ),
                            ActionItem(
                              icon: MyImageClass.qrCodeIcon,
                              label: 'Scan QR Code',
                              onTap: () {},
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
                              onTap: () {},
                            ),
                            ActionItem(
                              icon: MyImageClass.inviteFriendsIcon,
                              label: 'Invite Friends',
                              onTap: () {},
                            ),
                            ActionItem(
                              icon: MyImageClass.cashingPointsIcon,
                              label: 'Cashing Points',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: ScreenSize.screenHeight(context) * 0.03),

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

                  SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

                  // Merchants list
                  SizedBox(
                    height: 90,
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

                  SizedBox(height: ScreenSize.screenHeight(context) * 0.03),

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

                  SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

                  // Rewards list
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.27,
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

          ],
        ),
      ),
    );
  }
}