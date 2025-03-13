import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OtpVerificationController extends GetxController {
  var otpValue = ''.obs;
  var remainingSeconds = 56.obs;
  Timer? _timer;

  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void resetTimer() {
    remainingSeconds.value = 60;
    _timer?.cancel();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
