import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mepro_app/res/Widgets/CustomButton.dart';
import 'package:mepro_app/res/Widgets/CustomSettings_AppBar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

import '../../res/Colors/Colors.dart';
import '../../res/const/ScreenSize.dart';

class SelectReceiptScreen extends StatefulWidget {
  const SelectReceiptScreen({Key? key}) : super(key: key);

  @override
  State<SelectReceiptScreen> createState() => _SelectReceiptScreenState();
}

class _SelectReceiptScreenState extends State<SelectReceiptScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  bool _isUploading = false;
  double _uploadProgress = 0.0;
  String _fileName = "";

  Future<void> pickImage() async {
    final status = await Permission.photos.request();

    if (status.isGranted) {
      try {
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          print("Image selected: ${image.path}");

          // Get the file name from the path
          String fileName = path.basename(image.path);

          // Start the "upload" simulation
          setState(() {
            _isUploading = true;
            _uploadProgress = 0.0;
            _fileName = fileName;
          });

          // Simulate the upload process with increasing progress
          for (int i = 1; i <= 10; i++) {
            await Future.delayed(const Duration(milliseconds: 300));
            setState(() {
              _uploadProgress = i / 10;
            });
          }

          // Once upload is "complete", display the image
          setState(() {
            _selectedImage = File(image.path);
            _isUploading = false;
          });
        } else {
          print("No image selected");
        }
      } catch (e) {
        setState(() {
          _isUploading = false;
        });
        print('Error: Failed to pick image: $e');
      }
    } else {
      print("Permission denied. Redirecting to settings.");
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.screenWidth(context) * 0.05,
          ),
          child: Column(
            children: [
              CustomSettings_AppBar(screenName: 'Select Receipt'),
              Expanded(
                child: _selectedImage != null && !_isUploading
                    ? _buildImagePreview()
                    : _isUploading
                    ? _buildUploadingUI()
                    : _buildUploadArea(),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Continue',
                isPrimary: true,
                onPressed: () {
                  // Handle the continue logic
                  print("Continuing with selected receipt");
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.lightgreyColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextButton.icon(
              onPressed: pickImage,
              icon: Icon(Icons.refresh, color: AppColors.blackColor),
              label: Text(
                'Choose another receipt',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadingUI() {
    // Calculate percentage for display
    int percentage = (_uploadProgress * 100).round();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.lightgreyColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular progress indicator with red color, similar to the screenshot
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              value: _uploadProgress,
              strokeWidth: 6,
              backgroundColor: Colors.red.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),

          SizedBox(height: 16),

          // "Uploading... (65%)" text
          Text(
            'Uploading... ($percentage%)',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 12),

          // Show the file name
          Text(
            _fileName,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadArea() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.lightgreyColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Flexible space to push the content to the center
          Expanded(flex: 1, child: SizedBox()),

          // Upload icon
          InkWell(
            onTap: pickImage,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.lightgreyColor,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.upload_outlined,
                size: 40,
                color: AppColors.blackColor,
              ),
            ),
          ),

          SizedBox(height: 16),

          // "Upload" text
          Text(
            'Upload',
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 8),

          // Instruction text
          Text(
            'Select a receipt to upload',
            style: TextStyle(
              color: AppColors.lightgreyColor,
              fontSize: 14,
            ),
          ),

          SizedBox(height: 8),

          // Supported files text
          Text(
            'Files supported: jpg, jpeg, png, or pdf',
            style: TextStyle(
              color: AppColors.lightgreyColor,
              fontSize: 12,
            ),
          ),

          // Flexible space to push the content to the center
          Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}