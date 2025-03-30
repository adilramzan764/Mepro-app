import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/Colors/Colors.dart';
import '../../res/Widgets/AccountAllScreens_Widgets.dart';
import '../../res/const/ScreenSize.dart';

class AccountSecurityController extends GetxController {
  var biometricIdEnabled = false.obs;
  var faceIdEnabled = false.obs;
  var smsAuthenticatorEnabled = false.obs;
  var googleAuthenticatorEnabled = false.obs;
}

