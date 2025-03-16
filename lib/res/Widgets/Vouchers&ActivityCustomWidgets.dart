import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Controller/ActivityController.dart';
import '../../Controller/VoucherController.dart';
import '../../Model/Acitivity.dart';
import '../Colors/Colors.dart';
import '../const/ScreenSize.dart';

class VoucherCard extends StatelessWidget {
  final Map<String, dynamic> voucher;
  final double screenWidth;
  final double screenHeight;

  const VoucherCard({
    Key? key,
    required this.voucher,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // QR Code and logo
          SizedBox(
            width: screenWidth * 0.25,
            height: screenWidth * 0.25,
            child: Stack(
              children: [
                Container(
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    voucher['qrCode'],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Container(
                    width: screenWidth * 0.06,
                    height: screenWidth * 0.06,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(voucher['logo']),fit: BoxFit.cover),
                        border: Border.all(
                            color: AppColors.whiteColor,
                            width: 1
                        )
                    ),
                  ),
                ),

              ],
            ),
          ),

          // Voucher details
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voucher['title'],
                  style:  TextStyle(
                    fontSize: ScreenSize.screenHeight(context) * 0.017,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                  // maxLines: 2,
                  // overflow: TextOverflow.clip,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      'Valid until ${voucher['validUntil']}',
                      style:  TextStyle(
                          fontSize: ScreenSize.screenHeight(context) * 0.013,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      voucher['merchant'],
                      style: TextStyle(
                        fontSize: ScreenSize.screenHeight(context) * 0.013,
                        color: AppColors.red_mainColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (voucher['redeemDate'].isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      voucher['redeemDate'],
                      style:  TextStyle(
                        fontSize: ScreenSize.screenHeight(context) * 0.012,
                        color: AppColors.lightgreyColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Arrow button
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){},
                child: Icon(
                  Icons.chevron_right,
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class ActivityListItem extends StatelessWidget {
  final ActivityModel activity;
  final double screenWidth;
  final double screenHeight;

  const ActivityListItem({
    Key? key,
    required this.activity,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.018,
        horizontal: screenWidth * 0.03,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.lightgreyColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Activity Icon
          Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.lightgreyColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                activity.icon,
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
                color: AppColors.greyColor,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),

          // Activity Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.type,
                  style:  TextStyle(
                    fontSize: ScreenSize.screenHeight(context) * 0.018,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
                if (activity.description.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.005),
                    child: Text(
                      activity.description,
                      style: TextStyle(
                          fontSize: ScreenSize.screenHeight(context) * 0.014,
                          color: AppColors.lightgreyColor),
                    ),
                  ),
                if (activity.dateTime.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.005),
                    child: Text(
                      activity.dateTime,
                      style: TextStyle(
                          fontSize: ScreenSize.screenHeight(context) * 0.012,
                          color: AppColors.lightgreyColor),
                    ),
                  ),
              ],
            ),
          ),

          // Activity Points
          Text(
            activity.points >= 0
                ? '+${activity.points.toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => '${m[1]},',
            )}'
                : '${activity.points.toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                  (Match m) => '${m[1]},',
            )}',
            style: TextStyle(
              fontSize: ScreenSize.screenHeight(context) * 0.019,
              fontWeight: FontWeight.w600,
              color: activity.points >= 0 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}


Widget CustomAppBar_Vouchers_Activity(BuildContext context , var isSearching,String screenName){
  final double screenWidth = ScreenSize.screenWidth(context);
  final double screenHeight = ScreenSize.screenHeight(context);
  return Row(
    children: [
      SizedBox(
        height: screenHeight * 0.025,
        width: screenWidth * 0.12,
        child: SvgPicture.asset(
          'assets/Logo Mepro.svg',
          color: AppColors.red_mainColor,
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(width: screenWidth * 0.2),
       Text(
        screenName,
        style: TextStyle(
          color: AppColors.blackColor,
          fontSize: ScreenSize.screenWidth(context) * 0.045,
          fontWeight: FontWeight.w600,
        ),
      ),
      Spacer(),
      IconButton(
        icon: const Icon(CupertinoIcons.search, color: AppColors.blackColor),
        onPressed: () {
          isSearching.value = true;
        },
      ),
      IconButton(
        icon:  Icon(Icons.more_vert, color: AppColors.blackColor,
          size: screenWidth * 0.06, // Responsive icon size
        ),
        onPressed: () {},
      ),
    ],
  );
}

Widget CostumSearchBar_Vouchers_Activity<T>(TextEditingController searchController) {
  final T controller = Get.find<T>(); // Dynamically fetch the controller

  return TextField(
    controller: searchController,
    onChanged: (query) {
      if (controller is VoucherController) {
        controller.updateSearchQuery(query);
      }
      else if (controller is ActivityController) {
        controller.updateSearchQuery(query);
      }
    },
    decoration: InputDecoration(
      hintText: 'Search...',
      hintStyle: TextStyle(
        color: AppColors.lightgreyColor.withOpacity(0.4),
        fontSize: 13,
      ),
      prefixIcon: Icon(CupertinoIcons.search, color: AppColors.lightgreyColor),
      suffixIcon: IconButton(
        icon: Icon(Icons.close, color: AppColors.blackColor),
        onPressed: () {
          if (controller is VoucherController) {
            controller.clearSearch();
          }
          else if (controller is ActivityController) {
            controller.clearSearch();
          }
        },
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
  );
}