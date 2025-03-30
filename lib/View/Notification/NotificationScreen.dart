import 'package:flutter/material.dart';

import '../../res/Colors/Colors.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Notification',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.blackColor,
            ),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.red_mainColor,
              labelColor: AppColors.whiteColor,
              unselectedLabelColor: AppColors.blackColor,
              indicator: BoxDecoration(
                color: AppColors.red_mainColor,
              ),
              tabs: const [
                Tab(text: 'General'),
                Tab(text: 'Promotions'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildGeneralNotifications(),
                _buildPromotionsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralNotifications() {
    return ListView(
      children: [
        _buildSectionHeader('Today'),
        _buildNotificationItem(
          icon: Icons.shield_outlined,
          title: 'Account Security Alert 🔒',
          description: 'We\'ve noticed some unusual activity on your account. Please review your recent logins and update your password if necessary.',
          time: '09:41AM',
          hasRedDot: true,
        ),
        _buildNotificationItem(
          icon: Icons.system_update_outlined,
          title: 'System Update Available 📲',
          description: 'A new system update is ready for installation. It includes performance improvements and bug fixes.',
          time: '08:46AM',
          hasRedDot: true,
        ),
        _buildSectionHeader('Yesterday'),
        _buildNotificationItem(
          icon: Icons.lock_outline,
          title: 'Password Reset Successful ✅',
          description: 'Your password has been successfully reset. If you didn\'t request this change, please contact support immediately',
          time: '20:30PM',
          hasRedDot: false,
        ),
        _buildNotificationItem(
          icon: Icons.star_outline,
          title: 'Exciting New Feature 📱',
          description: 'We\'ve just launched a new feature that will enhance your user experience. Check it out now!',
          time: '16:29 PM',
          hasRedDot: false,
        ),
        _buildNotificationItem(
          icon: Icons.calendar_today_outlined,
          title: 'Event Reminder 📅',
          description: '',
          time: '',
          hasRedDot: false,
        ),
      ],
    );
  }

  Widget _buildPromotionsTab() {
    // This would be your Promotions tab content
    return const Center(
      child: Text('No promotion notifications'),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.lightgreyColor,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String description,
    required String time,
    required bool hasRedDot,
  }) {
    return InkWell(
      onTap: () {
        // Handle notification tap
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon circle
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.blackColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            // Notification content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      if (hasRedDot)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.red_mainColor,
                          ),
                        ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.lightgreyColor,
                      ),
                    ],
                  ),
                  if (description.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, right: 16),
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  if (time.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.lightgreyColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}