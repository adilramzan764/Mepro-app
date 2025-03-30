// views/receipt_photo_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Controller/ReceiptController.dart';
import '../../Model/Receipt.dart';
import '../../Routes/RoutesName.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Widgets/CustomSettings_AppBar.dart';
import '../../res/const/ScreenSize.dart';


class ReceiptPhotoScreen extends StatelessWidget {
  final ReceiptController controller = Get.put(ReceiptController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettings_AppBar(screenName: 'Receipt Photo'),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.receipts.length,
                  itemBuilder: (context, index) {
                    final receipt = controller.receipts[index];
                    return _buildReceiptItem(context, receipt);
                  },
                ),
              ),
            ),
            _buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptItem(BuildContext context, ReceiptModel receipt) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenSize.screenWidth(context) * 0.04,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(receipt.image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(receipt.id, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("${receipt.points} - ${receipt.store}\n${receipt.date}"),
        trailing: Icon(Icons.chevron_right, color: AppColors.lightgreyColor),
        onTap: () {},
      ),
    );
  }


  Widget _buildBottomButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.screenWidth(context) * 0.04,
        vertical: 16,
      ),
      child: Row(
        children: [
          // Select Receipt Button
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => Get.toNamed(RoutesName.selectReceiptScreen),
              icon: Icon(
                Icons.drive_folder_upload_rounded,
                color: AppColors.red_mainColor2,
              ),
              label: Text(
                'Select Receipt',
                style: TextStyle(
                  color: AppColors.red_mainColor2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightbuttoncolor,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          // Upload Receipt Button
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => controller.pickImage(ImageSource.camera),
              icon: Icon(
                Icons.camera_alt,
                color: AppColors.whiteColor,
              ),
              label: Text(
                'Upload Receipt',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red_mainColor2,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }}


