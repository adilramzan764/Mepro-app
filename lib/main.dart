import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mepro_app/View/HomeScreen/HomeScreen.dart';
import 'package:mepro_app/res/Colors/Colors.dart';

import 'Routes/AppRoutes.dart';
import 'Routes/RoutesName.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();

  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.red_mainColor2
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.red_mainColor2
    ..textColor = AppColors.blackColor
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes, // Using GetX routes
      initialRoute: RoutesName.splashScreen,
      // home: HomeScreen(),
      builder: (context, child) {
        return EasyLoading.init()(context, child);
      },
    );
  }
}


