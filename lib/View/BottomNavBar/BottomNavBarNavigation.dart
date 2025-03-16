import 'package:flutter/material.dart';
import 'package:mepro_app/View/HomeScreen/HomeScreen.dart';

import '../Account/AccountScreen.dart';
import '../ActivityScreen/Activityscreen.dart';
import '../MerchantsScreen/MerchantsScreen.dart';
import '../MyVouchersScreen/MyVouchersScreen.dart';
import 'BottomNavBar.dart';

class BottomNavBarNavigation extends StatefulWidget {


  @override
  _BottomNavBarNavigationState createState() => _BottomNavBarNavigationState();
}


// 2. Update BottomNavBarNavigation implementation
class _BottomNavBarNavigationState extends State<BottomNavBarNavigation> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(), // Home
      MerchantsScreen(),
      MyVoucherScreen(),
      ActivityScreen(),
      AccountScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}