import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/Colors.dart';
import '../const/ScreenSize.dart';

Widget BuildMerchantCard(String name, double rating, int points, String image, String badge,BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(badge,height: 25,width: 25,),


            // Merchant Image
            Container(
              width: ScreenSize.screenWidth(context) * 0.16,
              height: ScreenSize.screenHeight(context) * 0.065,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Badge
            // Favorite Icon
            Icon(
              Icons.favorite_border_outlined,
              color: AppColors.lightgreyColor,
              size: 22,
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Merchant Name
        Text(
          name,
          style:  TextStyle(
              fontWeight: FontWeight.w500,
              fontSize:                 ScreenSize.screenHeight(context) * 0.016,
              color: AppColors.greyColor
          ),
        ),
        const SizedBox(height: 5),
        // Rating and Points
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.red_mainColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Text(
                    rating.toString(),
                    style:  TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenSize.screenHeight(context) * 0.015,
                    ),
                  ),
                  SizedBox(width: 3,),
                  const Icon(
                    Icons.star,
                    color: AppColors.whiteColor,
                    size: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '$points point',
              style: TextStyle(
                color: AppColors.red_mainColor,
                fontWeight: FontWeight.w500,
                fontSize: ScreenSize.screenHeight(context) * 0.016,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
