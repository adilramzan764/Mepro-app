import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Controller/VoucherController.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Widgets/Vouchers&ActivityCustomWidgets.dart';
import '../../res/const/ScreenSize.dart';

class MyVoucherScreen extends StatelessWidget {
  final VoucherController controller = Get.put(VoucherController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = ScreenSize.screenWidth(context);
    final double screenHeight = ScreenSize.screenHeight(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Header with Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Obx(() {
                return controller.isSearching.value
                    ? Row(
                  children: [
                    Expanded(
                      child: CostumSearchBar_Vouchers_Activity<VoucherController>(controller.searchController),
                    ),
                  ],
                )
                    : CustomAppBar_Vouchers_Activity(context, controller.isSearching, 'My Voucher');
              }),
            ),

            // Tab bar
            Obx(() => Container(
              height: screenHeight * 0.05,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              decoration: BoxDecoration(color: AppColors.whiteColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  controller.tabs.length,
                      (index) => GestureDetector(
                    onTap: () => controller.changeTab(index),
                    child: Container(
                      width: screenWidth * 0.28,
                      height: screenHeight * 0.05,
                      decoration: BoxDecoration(
                        color: controller.selectedTabIndex.value == index
                            ? AppColors.red_mainColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        controller.tabs[index],
                        style: TextStyle(
                          color: controller.selectedTabIndex.value == index
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),

            // Voucher list
            Expanded(
              child: Obx(() {
                var filteredVouchers = controller.getFilteredVouchers();
                return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.01,
                  ),
                  itemCount: filteredVouchers.length,
                  itemBuilder: (context, index) {
                    final voucher = filteredVouchers[index];
                    return VoucherCard(
                      voucher: {
                        'title': voucher.title,
                        'validUntil': voucher.validUntil,
                        'merchant': voucher.merchant,
                        'qrCode': voucher.qrCode,
                        'logo': voucher.logo,
                        'redeemDate': voucher.redeemDate,
                      },
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
