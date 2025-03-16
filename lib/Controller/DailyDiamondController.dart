// Controller class remains the same
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../View/DailyDiamond/DiamondEarnedDialog.dart';

class DailyDiamondController extends GetxController {
  var todayCollected = false.obs;
  var buttonText = 'Diamond ME'.obs;
  var buttonEnabled = true.obs;

  List<DateTime> getDates() {
    final DateTime now = DateTime.now();
    final List<DateTime> dates = [];
    for (int i = -22; i <= 7; i++) {
      dates.add(DateTime(now.year, now.month, now.day + i));
    }
    return dates;
  }

  bool isToday(DateTime date) {
    final DateTime now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  bool isPast(DateTime date) {
    final DateTime now = DateTime.now();
    return date.isBefore(DateTime(now.year, now.month, now.day));
  }

  bool isGiftDay(DateTime date) {
    return date.day == 4 && date.month == 1 && date.year == 2025;
  }

  String formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year.toString().substring(2)}';
  }

  void collectDiamond(BuildContext context) {
    if (!buttonEnabled.value) return;
    todayCollected.value = true;
    buttonText.value = 'Come Back Again Tomorrow';
    buttonEnabled.value = false;
    showDiamondEarnedDialog(context, diamondAmount: 100);
  }
}