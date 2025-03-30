import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:mepro_app/res/Colors/Colors.dart';
import 'package:mepro_app/res/Widgets/CustomSettings_AppBar.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English (US)';

  // List of languages with their country codes and names
  final List<Map<String, dynamic>> _languages = [
    {
      'name': 'English (US)',
      'countryCode': 'US',
    },
    {
      'name': 'English (UK)',
      'countryCode': 'GB',
    },
    {
      'name': 'Mandarin',
      'countryCode': 'CN',
    },
    {
      'name': 'Spanish',
      'countryCode': 'ES',
    },
    {
      'name': 'Hindi',
      'countryCode': 'IN',
    },
    {
      'name': 'French',
      'countryCode': 'FR',
    },
    {
      'name': 'Arabic',
      'countryCode': 'AE',
    },
    {
      'name': 'Russian',
      'countryCode': 'RU',
    },
    {
      'name': 'Japanese',
      'countryCode': 'JP',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            CustomSettings_AppBar(screenName: 'App Language'),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(16),
                itemCount: _languages.length,
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final language = _languages[index];
                  final isSelected = language['name'] == _selectedLanguage;
        
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: isSelected
                          ? Border.all(color: AppColors.red_mainColor2, width: 1)
                          : null,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: CountryFlag.fromCountryCode(
                        language['countryCode'],
                        width: 40,
                        height: 30,
                      ),
                      title: Text(
                        language['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: isSelected
                          ? Icon(Icons.check, color: AppColors.red_mainColor2)
                          : null,
                      onTap: () {
                        setState(() {
                          _selectedLanguage = language['name'];
                        });
                      },
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

