import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mepro_app/res/Colors/Colors.dart';
import 'package:mepro_app/res/const/ScreenSize.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../Routes/RoutesName.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool _isFlashOn = false;
  bool _isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Scanner
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null && !_isDialogShowing) {
                  _showDetectedCodeDialog(barcode.rawValue!);
                }
              }
            },
          ),
          Padding(
            padding:  EdgeInsets.only(top: ScreenSize.screenHeight(context) * 0.08,left: ScreenSize.screenWidth(context) * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.close,color: AppColors.whiteColor,),
                Text('Scan QR Code',style: TextStyle(color: AppColors.whiteColor,fontSize: 18 ),),
                SizedBox(height: 20,width: 20,)
              ],
            ),
          ),

          // Scanner overlay
          Padding(
            padding:  EdgeInsets.only(bottom: ScreenSize.screenHeight(context) * 0.08),
            child: Center(
              child: Container(
                width: 250,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.red,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: ScreenSize.screenHeight(context) * 0.05,),

          // Bottom UI
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  "Can't scan the QR code?",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 12),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Handle manual code entry
                      Get.toNamed(RoutesName.enterCodeManuallyScreen);
                    },
                    child: const Text(
                      "Enter Code Manually",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Gallery button
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.photo_library, color: Colors.white),
                        onPressed: () {
                          // Open gallery
                        },
                      ),
                    ),

                    // Capture button
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red, width: 3),
                      ),
                    ),

                    // Flash button
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          _isFlashOn ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isFlashOn = !_isFlashOn;
                          });
                          cameraController.toggleTorch();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDetectedCodeDialog(String code) {
    setState(() {
      _isDialogShowing = true;
    });

    // Pause the scanner
    cameraController.stop();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("QR Code Detected"),
          content: Text("Detected code: $code"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
                // Resume scanning
                _resumeScanning();
              },
            ),
            TextButton(
              child: const Text("Proceed"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context, code); // Return the detected code to the previous screen
              },
            ),
          ],
        );
      },
    ).then((_) {
      // In case the dialog is dismissed in any other way
      if (_isDialogShowing) {
        _resumeScanning();
      }
    });
  }

  void _resumeScanning() {
    setState(() {
      _isDialogShowing = false;
    });
    cameraController.start();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}