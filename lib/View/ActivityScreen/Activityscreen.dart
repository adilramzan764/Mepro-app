import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Controller/ActivityController.dart';
import '../../Model/Acitivity.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Widgets/Vouchers&ActivityCustomWidgets.dart';
import '../../res/const/ScreenSize.dart';




class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final ActivityController controller = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = ScreenSize.screenWidth(context);
    final double screenHeight = ScreenSize.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Obx(() {
                return controller.isSearching.value
                    ? Row(
                  children: [
                    Expanded(
                      child: CostumSearchBar_Vouchers_Activity<ActivityController>(
                        controller.searchController,
                      ),
                    ),
                  ],
                )
                    : CustomAppBar_Vouchers_Activity(context, controller.isSearching, 'Activity');
              }),
            ),
            SizedBox(
              height: screenHeight * 0.05,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.changeTab(index);
                      },
                      child: Obx(() {
                        final isSelected = controller.selectedTabIndex.value == index;
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.red_mainColor.withOpacity(0.1)
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.red_mainColor.withOpacity(0.3)
                                  : Colors.grey.withOpacity(0.3),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              controller.categories[index],
                              style: TextStyle(
                                color: isSelected ? AppColors.red_mainColor : AppColors.blackColor,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                )

            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  itemCount: controller.filteredActivities.length,
                  itemBuilder: (context, index) {
                    final activity = controller.filteredActivities[index];
                    return ActivityListItem(
                      activity: activity,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}


