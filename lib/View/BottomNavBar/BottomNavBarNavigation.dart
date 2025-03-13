import 'package:flutter/material.dart';
import 'package:mepro_app/View/HomeScreen/HomeScreen.dart';

import 'BottomNavBar.dart';

class BottomNavBarNavigation extends StatefulWidget {


  @override
  _BottomNavBarNavigationState createState() => _BottomNavBarNavigationState();
}

class _BottomNavBarNavigationState extends State<BottomNavBarNavigation> {
  int _selectedIndex = 0; // Track current selected tab

  late List<Widget> _screens; // Declare list but initialize later



  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(), // Home
    Center(child: Text('screen 2')),
      Center(child: Text('screen 3')),
      Center(child: Text('screen 4')),
      Center(child: Text('screen 5')),
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}