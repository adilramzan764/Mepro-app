import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CashingPointsController extends GetxController {
  RxString enteredPoints = "0".obs;
  final double conversionRate = 0.001; // Assuming 1 point = $0.001
  final int availablePoints = 249560;

  void addDigit(String digit) {
    if (enteredPoints.value == "0") {
      enteredPoints.value = digit;
    } else {
      enteredPoints.value += digit;
    }
  }

  void backspace() {
    if (enteredPoints.value.length > 1) {
      enteredPoints.value = enteredPoints.value.substring(0, enteredPoints.value.length - 1);
    } else {
      enteredPoints.value = "0";
    }
  }

  void clear() {
    enteredPoints.value = "0";
  }

  double get calculatedAmount => int.parse(enteredPoints.value) * conversionRate;
}