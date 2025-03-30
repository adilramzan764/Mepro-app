import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mepro_app/res/Images/MyImages.dart';
import 'package:mepro_app/res/Widgets/CustomSettings_AppBar.dart';
import 'package:mepro_app/res/const/ScreenSize.dart';
import '../../Routes/RoutesName.dart';
import '../../res/Colors/Colors.dart';

class BuyPointsScreen extends StatefulWidget {
  const BuyPointsScreen({Key? key}) : super(key: key);

  @override
  State<BuyPointsScreen> createState() => _BuyPointsScreenState();
}

class _BuyPointsScreenState extends State<BuyPointsScreen> {
  int? selectedPointsIndex;

  final List<Map<String, dynamic>> pointsOptions = [
    {"points": 1000, "price": 1.00},
    {"points": 2000, "price": 2.00},
    {"points": 2500, "price": 2.50},
    {"points": 5000, "price": 5.00},
    {"points": 10000, "price": 10.00},
    {"points": 20000, "price": 20.00},
    {"points": 25000, "price": 25.00},
    {"points": 50000, "price": 50.00},
    {"points": 75000, "price": 75.00},
    {"points": 100000, "price": 100.00},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.screenWidth(context);
    double screenHeight = ScreenSize.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettings_AppBar(screenName: 'Buy Points'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 16),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: screenWidth * 0.15,
                              height: screenWidth * 0.15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(MyImageClass.silver),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Your Points', style: TextStyle(color: AppColors.lightgreyColor, fontSize: screenWidth * 0.035)),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        '249,560',
                                        style: TextStyle(color: AppColors.blackColor, fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        '(\$249.56)',
                                        style: TextStyle(color: AppColors.lightgreyColor, fontSize: screenWidth * 0.035),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.chevron_right, color: AppColors.lightgreyColor),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              childAspectRatio: 2.0,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: pointsOptions.length,
                            itemBuilder: (context, index) {
                              final option = pointsOptions[index];
                              final isSelected = selectedPointsIndex == index;
                              return GestureDetector(
                                onTap: () => setState(() => selectedPointsIndex = index),
                                child: Container(
                                  padding: EdgeInsets.all(screenWidth * 0.04),
                                  decoration: BoxDecoration(
                                    color: isSelected ? AppColors.red_mainColor2 : AppColors.whiteColor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            NumberFormatter.formatWithCommas(option['points']),
                                            style: TextStyle(color: isSelected ? AppColors.whiteColor : AppColors.blackColor, fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 4),
                                          Text('pts', style: TextStyle(color: isSelected ? AppColors.whiteColor : AppColors.lightgreyColor, fontSize: screenWidth * 0.035)),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text('\$${option['price'].toStringAsFixed(2)}', style: TextStyle(color: isSelected ? AppColors.whiteColor : AppColors.blackColor, fontSize: screenWidth * 0.04)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Continue button
            Container(
              width: double.infinity,
              height: ScreenSize.screenHeight(context) * 0.11,
              padding: const EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.06),
              child: ElevatedButton(
                onPressed: selectedPointsIndex != null
                    ? () {
                  // Handle continue with selected points package
                  Get.toNamed(
                    RoutesName.selectPaymentMethodScreen,
                    arguments: {
                      'amount': pointsOptions[selectedPointsIndex!]['price'],
                      'points': pointsOptions[selectedPointsIndex!]['points']
                    },
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red_mainColor2,
                  disabledBackgroundColor: Colors.grey.withOpacity(0.6),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: ScreenSize.screenHeight(context) * 0.02,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),          ],
        ),
      ),
    );
  }
}

class NumberFormatter {
  static String formatWithCommas(int number) {
    return number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}