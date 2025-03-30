import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Images/MyImages.dart';
import 'package:mepro_app/res/Widgets/CustomButton.dart';
import 'dart:math' as math;

import '../../Routes/RoutesName.dart';
import '../../View/BottomNavBar/BottomNavBarNavigation.dart';
import '../../res/Colors/Colors.dart';
import '../../res/const/ScreenSize.dart';

import 'dart:math' as math;
import 'package:confetti/confetti.dart';

class CustomPointsEarnedDialog extends StatefulWidget {
  final int pointsAmount;
  final String decsription;
  final String nextScreen;
  final String activity;

  const CustomPointsEarnedDialog({
    Key? key,
    required this.pointsAmount,
    required this.decsription,
    required this.nextScreen,
    required this.activity
  }) : super(key: key);

  @override
  State<CustomPointsEarnedDialog> createState() => _DiamondEarnedDialogState();
}

class _DiamondEarnedDialogState extends State<CustomPointsEarnedDialog> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    // Start the confetti animation when the dialog opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _confettiController.play();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildConfettiBackground(),
          _buildDialogContent(context),
        ],
      ),
    );
  }

  Widget _buildConfettiBackground() {
    return Positioned.fill(
      child: Stack(
        children: [
          // Top left confetti
          Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.yellow,
                Colors.green,
                Colors.pink,
                Colors.purple,
                Colors.orange,
              ],
            ),
          ),
          // Top right confetti
          Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.yellow,
                Colors.green,
                Colors.pink,
                Colors.purple,
                Colors.orange,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCoinAnimation(),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'You ${widget.activity} ${widget.pointsAmount} Points!',
              style: TextStyle(
                fontSize: ScreenSize.screenHeight(context) * 0.025,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: ScreenSize.screenHeight(context) * 0.018),
          Text(
            widget.decsription,
            style: TextStyle(
              fontSize: ScreenSize.screenHeight(context) * 0.017,
              color: AppColors.lightgreyColor,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(
                text: 'OK',
                isPrimary: true,
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.offAll(BottomNavBarNavigation());
                }),
          )
        ],
      ),
    );
  }

  Widget _buildCoinAnimation() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Main red circle
        Container(
          width: ScreenSize.screenWidth(context) * 0.34,
          height: ScreenSize.screenHeight(context) * 0.12,
          decoration: const BoxDecoration(
            color: AppColors.red_mainColor2,
            shape: BoxShape.circle,
          ),
          child: Center(
            // You can replace this with your actual diamond/coin icon
            child: SvgPicture.asset(
              MyImageClass.pointsIcon,
              color: AppColors.whiteColor,
              width: ScreenSize.screenWidth(context) * 0.12,
              height: ScreenSize.screenHeight(context) * 0.05,
            ),
          ),
        ),

        // Confetti dots
        ...List.generate(
          8,
              (index) => Positioned(
            left: 50 + 60 * math.cos(index * math.pi / 4),
            top: 50 + 60 * math.sin(index * math.pi / 4),
            child: Container(
              width: index % 2 == 0 ? 8 : 5,
              height: index % 2 == 0 ? 8 : 5,
              decoration: const BoxDecoration(
                color: AppColors.red_mainColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Helper function to show the dialog
Future<void> showCustomPointsEarnedDialog(BuildContext context,
    int pointsAmount,String description,String nextScreen, String activity) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.7),
    builder: (BuildContext context) {
      return CustomPointsEarnedDialog(pointsAmount: pointsAmount, decsription: description, nextScreen: nextScreen, activity: activity,);
    },
  );
}
