import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Widgets/CustomIconButton.dart';
import '../../res/const/ScreenSize.dart';

class InvitedFriendsTab extends StatelessWidget {
  InvitedFriendsTab({super.key});

  final List<Map<String, dynamic>> invitedFriends = [
    {
      'name': 'Charlotte Hanlin',
      'joinDate': 'Joined Today, Dec 22, 2024',
      'points': 5000,
      'avatarColor': Colors.red[200],
    },
    {
      'name': 'William Barnes',
      'joinDate': 'Joined on Dec 19, 2024',
      'points': 5000,
      'avatarColor': Colors.blue[200],
    },
    {
      'name': 'Maryland Winkles',
      'joinDate': 'Joined on Dec 17, 2024',
      'points': 5000,
      'avatarColor': Colors.amber[200],
    },
  ];

  final String referralCode = "ABC123XYZ"; // Example referral code

  void _shareReferralCode() {
    final String message = "Join now using my referral code: $referralCode and earn rewards!";
    Share.share(message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16),
            itemCount: invitedFriends.length,
            itemBuilder: (context, index) {
              final friend = invitedFriends[index];
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: friend['avatarColor'],
                          child: Text(
                            friend['name'].substring(0, 1),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                friend['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                friend['joinDate'],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${friend['points']} pts',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    height: 1,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: CustomIconbutton(
            icon: Icon(Icons.share, color: AppColors.whiteColor),
            label: 'Share My Referral Code',
            onPressed: _shareReferralCode,
          ),
        ),
      ],
    );
  }
}
