import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mepro_app/res/Colors/Colors.dart';

import '../../res/Images/MyImages.dart';

class BottomNavBar extends StatefulWidget {
   int currentIndex;
  final Function(int) onTap;

   BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {


    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (index) {
        setState(() {
          widget.currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFFA5D75),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 10),

      backgroundColor: AppColors.whiteColor,
      items: [
        BottomNavigationBarItem(
          icon: Transform.scale(
            scale: 0.8,
            child: SvgPicture.asset(
              MyImageClass.homeIcon,
              color: widget.currentIndex == 0 ? AppColors.red_mainColor2 : Colors.grey,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            MyImageClass.merchantsIcon,
            height: 24,
            color: widget.currentIndex == 1 ? const Color(0xFFFA5D75) : Colors.grey,
          ),
          label: 'Merchants',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            MyImageClass.voucherIcon,
            height: 24,
            color: widget.currentIndex == 2 ? const Color(0xFFFA5D75) : Colors.grey,
          ),
          label: 'My Voucher',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            MyImageClass.activityIcon,
            height: 24,
            color: widget.currentIndex == 3 ? const Color(0xFFFA5D75) : Colors.grey,
          ),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            MyImageClass.accountIcon,
            height: 24,
            color: widget.currentIndex == 4 ? const Color(0xFFFA5D75) : Colors.grey,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}