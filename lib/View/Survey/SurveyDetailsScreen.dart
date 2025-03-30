import 'package:flutter/material.dart';
import 'package:mepro_app/res/Images/MyImages.dart';
import 'package:mepro_app/res/Widgets/CustomButton.dart';
import 'package:mepro_app/res/Widgets/CustomSettings_AppBar.dart';

import '../../res/Colors/Colors.dart';
import '../../res/const/ScreenSize.dart';
import 'SurveyEarnedDialog.dart';

class SurveyDetailsScreen extends StatelessWidget {
  const SurveyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSettings_AppBar(screenName: 'Survey Details'),
              // Survey image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: ScreenSize.screenWidth(context),
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.whiteColor,
                    image: DecorationImage(
                      image: AssetImage(
                        MyImageClass.survey, // Replace with your image path
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: ScreenSize.screenWidth(context),
                color: AppColors.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Survey title
                    const Text(
                      'Rewarding Experiences: Share Your Thoughts, Earn Big!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Points and time
                    Row(
                      children: [
                        Text(
                          '750 points',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.lightgreyColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightgreyColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '1min',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.lightgreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Description
                    Text(
                      'Influence your rewards journey! We value your insights. Share your thoughts on rewarding experiences, and unlock the door to earning big with Mepro. Your feedback shapes the future of your rewards!',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.lightgreyColor,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.screenHeight(context) * 0.35,
                    ),
                    CustomButton(
                        text: 'Start Survey', isPrimary: true, onPressed: () {
                      showSurveyEarnedDialog(context);
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
