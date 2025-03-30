import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Routes/RoutesName.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';
import '../../res/Widgets/CustomIconButton.dart';
import '../../res/Widgets/CustomPointsEarnedDialog.dart';
import '../../res/const/ScreenSize.dart';

class YourReferralsTab extends StatelessWidget {
  final String referralCode ; // Example referral code
   YourReferralsTab({super.key, required this.referralCode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Illustration
          SizedBox(height: ScreenSize.screenHeight(context) * 0.005,),
          Container(
            height: ScreenSize.screenHeight(context) * 0.23,
            width: double.infinity,
            alignment: Alignment.center,
            child: Image.asset(
              MyImageClass.inviteFriends, // Replace with actual image path
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: ScreenSize.screenHeight(context) * 0.02,),

          // Title
          Text(
            'Invite Friends, Get 5,000 Points!',
            style: TextStyle(
              fontSize: ScreenSize.screenHeight(context)* 0.022,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: ScreenSize.screenHeight(context) * 0.02,),

          // Referral Code
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your Referral Code',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: ScreenSize.screenHeight(context) * 0.02,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      referralCode,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: referralCode));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Referral code copied to clipboard')),
                        );
                      },
                      child: Icon(
                        Icons.copy,
                        color: AppColors.greyColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),


          // Instructions
          _buildInstructionItem(
            context,
            '1',
            'Invite your friends',
            'Send your friends your personal invite link.',
          ),

          SizedBox(height: ScreenSize.screenHeight(context) * 0.02,),

          _buildInstructionItem(
            context,
            '2',
            'You get free points',
            'When they join Mepro, you unlock 5,000 free points.',
            showTerms: true,
          ),

          Spacer(),


          // Share button
          CustomIconbutton(icon: Icon(Icons.share, color: AppColors.whiteColor), label: 'Share My Referral Code', onPressed: () {
            showCustomPointsEarnedDialog(context,
                5000, // Example points amount
                'Someone has joined using your referral code. Keep those referrals coming and watch your points soar!',
                RoutesName.homeScreen, // Replace with your next screen route
                'Earned'
            );
          },)
        ],
      ),
    );
  }

  Widget _buildInstructionItem(BuildContext context, String number, String title, String subtitle, {bool showTerms = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Color(0xFFFFC107),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.star,
              color: AppColors.whiteColor,
              size: 20,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: ScreenSize.screenHeight(context) * 0.018,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                ],
              ),
              if (showTerms)
                GestureDetector(
                  onTap: () {
                    // Show terms
                  },
                  child: Text(
                    'Terms apply.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.red_mainColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

}
