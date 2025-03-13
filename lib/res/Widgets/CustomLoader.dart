import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/View/BottomNavBar/BottomNavBarNavigation.dart';

import '../../View/BottomNavBar/BottomNavBar.dart';

class CustomLoader {
  static Future<void> startLoading({required String loadingStatus}) async {
    await EasyLoading.show(
      status: loadingStatus,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static Future<void> stopLoading() async {
    await EasyLoading.dismiss();
  }

  static Future<void> stopLoadingWithDelay({int milliseconds = 1000}) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    await stopLoading();
  }

  static Future<void> showLoadingForSigning(BuildContext context) async {
    await startLoading(loadingStatus: 'Signing In...');
    await Future.delayed(Duration(seconds: 2));
    await stopLoading();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>     BottomNavBarNavigation(),

      ),

    );  }
}
