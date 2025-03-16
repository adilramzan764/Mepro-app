import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mepro_app/res/Colors/Colors.dart';

import '../const/ScreenSize.dart';

class ActionItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const ActionItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: ScreenSize.screenWidth(context) * 0.16,
            height: ScreenSize.screenHeight(context) * 0.065,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBED),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
                color: const Color(0xFFFA5D75),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF404040),
            ),
          ),
        ],
      ),
    );
  }
}

class MerchantItem extends StatelessWidget {
  final String image;
  final String name;

  const MerchantItem({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(height: 8),
        SizedBox(
          width: ScreenSize.screenWidth(context) * 0.18,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF404040),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class RewardItem extends StatelessWidget {
  final String image;
  final String title;
  final int points;
  final String merchantName;

  const RewardItem({
    Key? key,
    required this.image,
    required this.title,
    required this.points,
    required this.merchantName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.screenWidth(context) * 0.63,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              width: double.infinity,
              height: ScreenSize.screenHeight(context) * 0.14,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: ScreenSize.screenHeight(context) * 0.007),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:  TextStyle(
                    fontSize: ScreenSize.screenHeight(context) * 0.016,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF404040),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: ScreenSize.screenHeight(context) * 0.002),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '$points points',
                      style:  TextStyle(
                        fontSize: ScreenSize.screenHeight(context) * 0.013,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyColor,
                      ),
                    ),
                    SizedBox(width: ScreenSize.screenWidth(context) * 0.015),

                    Text(
                      merchantName,
                      style:  TextStyle(
                        fontSize: ScreenSize.screenHeight(context) * 0.013,
                        fontWeight: FontWeight.w400,
                        color: AppColors.red_mainColor2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}