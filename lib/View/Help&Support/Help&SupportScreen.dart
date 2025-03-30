import 'package:flutter/material.dart';

import '../../res/Widgets/CustomSettings_AppBar.dart';
import '../../res/const/ScreenSize.dart';



class HelpSupportScreen extends StatelessWidget {
  // List of all support options
  final List<Map<String, String>> supportOptions = [
    {'title': 'FAQ'},
    {'title': 'Contact Support'},
    {'title': 'Privacy Policy'},
    {'title': 'Terms of Service'},
    {'title': 'Partner'},
    {'title': 'Job Vacancy'},
    {'title': 'Accessibility'},
    {'title': 'Feedback'},
    {'title': 'About us'},
    {'title': 'Rate us'},
    {'title': 'Visit Our Website'},
    {'title': 'Follow us on Social Media'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomSettings_AppBar(screenName: 'Help & Support'),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                  bottom: ScreenSize.screenHeight(context) * 0.005,
                ),
                itemCount: supportOptions.length,

                itemBuilder: (context, index) {
                  return
                    InkWell(
                      onTap: (){},
                      child: Container(
                        padding:  EdgeInsets.symmetric(
                          horizontal: ScreenSize.screenWidth(context) * 0.06,
                          vertical: ScreenSize.screenHeight(context) * 0.017,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              supportOptions[index]['title']!,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: ScreenSize.screenWidth(context) * 0.045,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black54,
                              size: ScreenSize.screenWidth(context) * 0.07,
                            ),
                          ],
                        ),
                      ),
                    );


                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

