import 'package:flutter/material.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Widgets/AccountAllScreens_Widgets.dart';
import '../../res/const/ScreenSize.dart';

class NotificationSettings_Screen extends StatefulWidget {
  const NotificationSettings_Screen({Key? key}) : super(key: key);

  @override
  State<NotificationSettings_Screen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationSettings_Screen> {
  // Map to store toggle states
  Map<String, bool> notificationSettings = {
    'New Rewards Alert': true,
    'Points Update': false,
    'Special Promotions': true,
    'Security Alerts': true,
    'Expiration Alerts': true,
    'Survey Opportunities': true,
    'Tier Progress': false,
    'Referral Bonuses': false,
    'Store Nearby Deals': true,
    'App Updates and News': false,
    'Birthday Rewards': false,
    'Location-Based Rewards': false,
    'Important Announcements': true,
    'App Tips and Tutorials': false,
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.screenWidth(context);
    double screenHeight = ScreenSize.screenHeight(context);
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.screenWidth(context) * 0.05,
              vertical: 16,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: ScreenSize.screenHeight(context) - 100,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(Icons.arrow_back, color: AppColors.blackColor, size: screenWidth * 0.06)),
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
                  ...notificationSettings.entries.map((entry) {
                    return BuildToogleWidget(
                      title: entry.key,
                      isEnabled: entry.value,
                      onChanged: (value) {
                        setState(() {
                          notificationSettings[entry.key] = value;
                        });
                      }, context: context,
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}
