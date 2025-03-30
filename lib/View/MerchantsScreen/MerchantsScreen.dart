import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/MerchantsController.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Images/MyImages.dart';
import '../../res/Widgets/MerchantScreen_Widget.dart';
import '../../res/const/ScreenSize.dart';


class MerchantsScreen extends StatelessWidget {
  final MerchantsController controller = Get.put(MerchantsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo Container
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.025,
                    width: ScreenSize.screenWidth(context) * 0.12,
                    child: SvgPicture.asset(
                      'assets/Logo Mepro.svg',
                      color: AppColors.red_mainColor,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Title
                  Text(
                    'Merchants',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: ScreenSize.screenWidth(context) * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Menu Icon
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: AppColors.blackColor,
                      size: ScreenSize.screenWidth(context) * 0.06,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) => controller.updateSearchQuery(value),
                  decoration: InputDecoration(
                    hintText: 'Search Merchants..',
                    hintStyle: TextStyle(
                      color: AppColors.lightgreyColor.withOpacity(0.4),
                      fontSize: 13,
                    ),
                    prefixIcon:
                    Icon(Icons.search, color: AppColors.lightgreyColor),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.02),

            // Category filters
            SizedBox(
              height: ScreenSize.screenHeight(context) * 0.05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.selectCategory(index),
                    child: Obx(() =>
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: controller.selectedCategoryIndex.value == index
                                ? AppColors.red_mainColor.withOpacity(0.1)
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: controller.selectedCategoryIndex.value == index
                                  ? AppColors.red_mainColor.withOpacity(0.3)
                                  : Colors.grey.withOpacity(0.3),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              controller.categories[index],
                              style: TextStyle(
                                  color: controller.selectedCategoryIndex.value == index
                                      ? AppColors.red_mainColor
                                      : AppColors.blackColor,
                                  fontWeight: controller.selectedCategoryIndex.value == index
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                    )

                  );
                },
              ),
            ),

            // Merchant Grid
            Obx(() => Expanded(
              child: controller.filteredMerchants.isEmpty
                  ? Center(child: Text('No merchants found'))
                  : GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: controller.filteredMerchants.map((merchant) =>
                    BuildMerchantCard(
                      merchant.name,
                      merchant.rating,
                      merchant.distance,
                      merchant.image,
                      merchant.badge,
                      context,
                    ),
                ).toList(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
