import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Widgets/CustomSettings_AppBar.dart';

import '../../Model/Survey.dart';
import '../../Routes/RoutesName.dart';
import '../../res/Colors/Colors.dart';
import '../../res/const/ScreenSize.dart';

class SurveyScreen extends StatelessWidget {
  SurveyScreen({Key? key}) : super(key: key);

  // Sample survey data
  final List<SurveyModel> surveys = [
    SurveyModel(
      title: 'Rewarding Experiences:',
      subtitle: 'Share Your Thoughts, Earn Points',
      points: 750,
      minutes: 1,
      imagePath: 'assets/survey.png',
    ),
    SurveyModel(
      title: 'Mepro Preferences:',
      subtitle: 'Your Ideal Rewards Await!',
      points: 1500,
      minutes: 3,
      imagePath: 'assets/survey.png',
    ),
    SurveyModel(
      title: 'Shopping Habits',
      subtitle: 'Unleashed: Earn Points With Us',
      points: 2000,
      minutes: 3,
      imagePath: 'assets/survey.png',
    ),
    SurveyModel(
      title: 'Merchant Magic:',
      subtitle: 'Which Brands Do You Love Most?',
      points: 750,
      minutes: 1,
      imagePath: 'assets/images/survey4.jpg',
    ),
    SurveyModel(
      title: 'Points Power:',
      subtitle: 'Tell Us Your Preferred Earning Methods',
      points: 1000,
      minutes: 2,
      imagePath: 'assets/images/survey5.jpg',
    ),
    SurveyModel(
      title: 'Mepro Lifestyle:',
      subtitle: 'How Do You Like to Be Rewarded?',
      points: 1250,
      minutes: 2,
      imagePath: 'assets/images/survey6.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettings_AppBar(screenName: 'Survey'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.screenWidth(context) * 0.05,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      _buildHeaderCard(context),
                      const SizedBox(height: 16),
                      ...surveys.map((survey) => _buildSurveyItem(context, survey)).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildHeaderCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.red_mainColor2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Earn Points by Answering Surveys',
            style: TextStyle(
              fontSize: ScreenSize.screenWidth(context) * 0.045,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(height: 4),
           Text(
            'Terms & Conditions apply.',
            style: TextStyle(
              fontSize: ScreenSize.screenWidth(context) * 0.035,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurveyItem(BuildContext context, SurveyModel survey) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // Handle survey tap
          Get.toNamed(RoutesName.surveyDetailsScreen);
          print('Selected survey: ${survey.title}');
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Survey image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    survey.imagePath,
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                    // Use a placeholder if image fails to load
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 75,
                      height: 75,
                      color: AppColors.lightgreyColor.withOpacity(0.3),
                      child: const Icon(Icons.image, color: AppColors.lightgreyColor),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Survey details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        survey.title,
                        style:  TextStyle(
                          fontSize: ScreenSize.screenWidth(context) * 0.04,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor,
                        ),
                      ),
                      if (survey.subtitle != null)
                        Text(
                          survey.subtitle!,
                          style:  TextStyle(
                            fontSize: ScreenSize.screenWidth(context) * 0.037,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackColor,
                          ),
                        ),
                      const SizedBox(height: 6),
                      Text(
                        '${survey.points} points · ${survey.minutes} ${survey.minutes == 1 ? 'min' : 'mins'}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.lightgreyColor,
                        ),
                      ),
                    ],
                  ),
                ),

                // Arrow icon
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.blackColor,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}