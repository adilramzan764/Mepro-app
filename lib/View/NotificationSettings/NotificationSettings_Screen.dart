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
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.screenBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
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
                children: notificationSettings.entries.map((entry) {
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
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      width: 52,
      height: 32,
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
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onTap: () => onChanged(!value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

