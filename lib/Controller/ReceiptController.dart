// controllers/receipt_controller.dart
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Model/Receipt.dart';
import '../res/Images/MyImages.dart';

class ReceiptController extends GetxController {
  var receipts = <ReceiptModel>[].obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    loadReceipts();
  }

  void loadReceipts() {
    receipts.assignAll([
      ReceiptModel(id: 'Receipt 0759', points: '2,000 points', store: 'McDonald\'s', date: 'Yesterday, Dec 21, 2023-16:20 PM', image: MyImageClass.receipt_pic),
      ReceiptModel(id: 'Receipt0758', points: '1,500 points', store: 'Starbucks', date: 'Dec 20, 2023-08:45AM', image: MyImageClass.receipt_pic),
      ReceiptModel(id: 'Receipt0757', points: '2,500 points', store: 'Dunkin\' Donuts', date: 'Dec 19, 2023-19:43PM', image: MyImageClass.receipt_pic),
      ReceiptModel(id: 'Receipt 0756', points: '2,000 points', store: 'Burger King', date: 'Dec 18, 2023-21:27 PM', image: MyImageClass.receipt_pic),
      ReceiptModel(id: 'Receipt0755', points: '1,000 points', store: 'Coca-Cola', date: 'Dec 17, 2023-14:56 PM', image: MyImageClass.receipt_pic),
      ReceiptModel(id: 'Receipt 0754', points: '1,500 points', store: 'Pizza Hut', date: 'Dec 16, 2023-12:30 PM', image: MyImageClass.receipt_pic),
    ]);
  }

  Future<void> pickImage(ImageSource source) async {
    final status = await Permission.camera.request();

    if (status.isGranted) {
      try {
        final XFile? image = await _picker.pickImage(source: source);
        if (image != null) {
          print("Image selected: \${image.path}");
        } else {
          print("No image selected");
        }
      } catch (e) {
        print('Error: Failed to pick image: \$e');
      }
    } else {
      print("Permission denied. Redirecting to settings.");
      openAppSettings();
    }
  }
}