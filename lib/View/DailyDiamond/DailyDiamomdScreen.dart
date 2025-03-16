import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/DailyDiamondController.dart';
import '../../res/Colors/Colors.dart';
import '../../res/const/ScreenSize.dart';

class DailyDiamondScreen extends StatelessWidget {
  const DailyDiamondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DailyDiamondController());
    final List<DateTime> dates = controller.getDates();

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.screenBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          'Daily Diamond',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                        'Collect Diamond Today!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          'Level Up Your Day! Claim Your Daily Stamp & Fuel Your Rewards!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.lightgreyColor,
                              height: 1.4),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 1),
                          itemCount: dates.length,
                          itemBuilder: (context, index) {
                            final date = dates[index];
                            final isDateToday = controller.isToday(date);
                            final isDatePast = controller.isPast(date);
                            final isGift = controller.isGiftDay(date);

                            if (isDateToday) {
                              return Obx(() => _buildGridItem(
                                    context,
                                    date,
                                    isDateToday,
                                    isDatePast,
                                    isGift,
                                    isCollected:
                                        controller.todayCollected.value ||
                                            isDatePast,
                                    controller: controller,
                                  ));
                            }
                            return _buildGridItem(
                              context,
                              date,
                              isDateToday,
                              isDatePast,
                              isGift,
                              isCollected: isDatePast,
                              controller: controller,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: ScreenSize.screenHeight(context) * 0.13,
              width: double.infinity,
              color: AppColors.whiteColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.screenHeight(context) * 0.035,
                  horizontal: ScreenSize.screenWidth(context) * 0.14,
                ),
                child: Obx(() =>
                    ElevatedButton(
                      onPressed: controller.buttonEnabled.value
                          ? () => controller.collectDiamond(context)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.buttonEnabled.value
                            ? AppColors.red_mainColor2
                            : Colors.grey.shade300,
                        foregroundColor: AppColors.whiteColor,
                        minimumSize: Size(ScreenSize.screenWidth(context), 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        controller.buttonText.value,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    DateTime date,
    bool isDateToday,
    bool isDatePast,
    bool isGift, {
    required bool isCollected,
    required DailyDiamondController controller,
  }) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color:
                  isCollected ? AppColors.red_mainColor : AppColors.whiteColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: isDateToday && !isCollected
                    ? AppColors.red_mainColor
                    : isCollected
                        ? AppColors.red_mainColor
                        : Colors.grey.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Center(
              child: isGift
                  ? Icon(
                      Icons.card_giftcard,
                      color: isCollected
                          ? AppColors.whiteColor
                          : Colors.grey.withOpacity(0.5),
                      size: 20,
                    )
                  : Icon(
                      Icons.diamond,
                      color: isCollected
                          ? AppColors.whiteColor
                          : Colors.grey.withOpacity(0.5),
                      size: 20,
                    ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          isDateToday ? 'Today' : controller.formatDate(date),
          style: TextStyle(
              fontSize: 10,
              color: AppColors.lightgreyColor,
              fontWeight: isDateToday ? FontWeight.w500 : FontWeight.normal),
        ),
      ],
    );
  }
}
