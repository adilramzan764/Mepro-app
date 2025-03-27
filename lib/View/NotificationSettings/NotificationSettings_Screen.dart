import 'package:flutter/material.dart';
import '../../res/Colors/Colors.dart';
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
                    return _buildNotificationSetting(
                      title: entry.key,
                      isEnabled: entry.value,
                      onChanged: (value) {
                        setState(() {
                          notificationSettings[entry.key] = value;
                        });
                      },
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

  Widget _buildNotificationSetting({
    required String title,
    required bool isEnabled,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: ScreenSize.screenWidth(context) * 0.04,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor.withOpacity(0.8),
              ),
            ),
          ),
          _buildCustomSwitch(
            value: isEnabled,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomSwitch({
    // required BuildContext context,
    required bool value,
    required Function(bool) onChanged,

  }) {
    double screenWidth = ScreenSize.screenWidth(context);
        double screenHeight = ScreenSize.screenHeight(context);
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: screenWidth * 0.15,
        height: screenHeight * 0.041,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: value ? AppColors.red_mainColor : Colors.grey.shade300,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: value ? 24 : 4,
              top: 4,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
