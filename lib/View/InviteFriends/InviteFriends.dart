import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepro_app/res/Widgets/CustomSettings_AppBar.dart';
import '../../res/Colors/Colors.dart';
import 'InvitedFriendsTab.dart';
import 'YourReferralsTab.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({Key? key}) : super(key: key);

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  bool isYourReferralsTab = true;
  final String referralCode = "ANDREW856";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettings_AppBar(screenName: 'Invite Friends'),
            // Tab buttons
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  _buildTabButton('Your Referrals', isYourReferralsTab, () {
                    setState(() {
                      isYourReferralsTab = true;
                    });
                  }),
                  _buildTabButton('Invited Friends (24)', !isYourReferralsTab, () {
                    setState(() {
                      isYourReferralsTab = false;
                    });
                  }),
                ],
              ),
            ),
        
            // Content
            Expanded(
              child: isYourReferralsTab
                  ? YourReferralsTab(referralCode: referralCode,)
                  : InvitedFriendsTab(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, bool isActive, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? AppColors.red_mainColor2 : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? AppColors.whiteColor : AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }



}