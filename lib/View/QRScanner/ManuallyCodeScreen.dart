import 'package:flutter/material.dart';
import 'package:mepro_app/Routes/RoutesName.dart';
import 'package:mepro_app/View/Survey/SurveyEarnedDialog.dart';
import 'package:mepro_app/res/Widgets/CustomButton.dart';
import 'package:mepro_app/res/Widgets/CustomSettings_AppBar.dart';
import 'package:mepro_app/res/const/ScreenSize.dart';

import '../../res/Widgets/CustomPointsEarnedDialog.dart';

class EnterCodeManuallyScreen extends StatefulWidget {
  const EnterCodeManuallyScreen({super.key});

  @override
  State<EnterCodeManuallyScreen> createState() => _EnterCodeManuallyScreenState();
}

class _EnterCodeManuallyScreenState extends State<EnterCodeManuallyScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with example value if needed
    _codeController.text = "G8X0Z6H3L5B4V9";
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettings_AppBar(screenName: 'Enter Code Manually'),
            // Text input field
            SizedBox(height: ScreenSize.screenHeight(context) * 0.02,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0, ),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: _codeController,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                autocorrect: false,
                enableSuggestions: false,
              ),
            ),
        
            const Spacer(),
        
            // Submit button
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth(context) * 0.08),
              child: CustomButton(text: 'Submit', isPrimary: true, onPressed: (){
                // Handle submission of code
                if (_codeController.text.isNotEmpty) {
                  showCustomPointsEarnedDialog(context,
                    25000, // Example points amount
                    'Your dedication pays off! Keep collecting & watch your level soar',
                    RoutesName.homeScreen, // Replace with your next screen route
                    'Earned'
                  );
                }
              }),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

// Usage in "Enter Code Manually" button from QR Scanner screen:
/*
TextButton(
  onPressed: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EnterCodeManuallyScreen(),
      ),
    );

    if (result != null) {
      // Handle the manually entered code
      // Same as if it was scanned
    }
  },
  child: const Text("Enter Code Manually"),
),
*/