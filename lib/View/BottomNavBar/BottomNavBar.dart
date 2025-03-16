// 1. Update BottomNavBar to be STATELESS
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';
import 'BottomNavBarNavigation.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap, // Directly use parent's callback
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.red_mainColor,
      unselectedItemColor: AppColors.greyColor,
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: AppColors.whiteColor,
      items: [
        _buildNavItem(
          icon: MyImageClass.homeIcon,
          label: 'Home',
          index: 0,
        ),
        _buildNavItem(
          icon: MyImageClass.merchantsIcon,
          label: 'Merchants',
          index: 1,
        ),
        _buildNavItem(
          icon: MyImageClass.voucherIcon,
          label: 'My Voucher',
          index: 2,
        ),
        _buildNavItem(
          icon: MyImageClass.activityIcon,
          label: 'Activity',
          index: 3,
        ),
        _buildNavItem(
          icon: MyImageClass.accountIcon,
          label: 'Account',
          index: 4,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        height: 24,
        color: currentIndex == index
            ? AppColors.red_mainColor
            : AppColors.greyColor,
      ),
      activeIcon: SvgPicture.asset(
        icon,
        height: 24,
        color: AppColors.red_mainColor,
      ),
      label: label,
    );
  }
}
