import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../res/Colors/Colors.dart';
import '../../res/Widgets/MyProfileScreen_Widgets.dart';
import '../../res/const/ScreenSize.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'Andrew Ainsley');
  final TextEditingController _emailController = TextEditingController(text: 'andrew.ainsley@yourdomain.com');
  final TextEditingController _phoneController = TextEditingController(text: '+1111 467 378 399');
  final TextEditingController _birthdateController = TextEditingController(text: '12/25/1995');

  String _selectedGender = 'Male';
  final List<String> _genderOptions = ['Male', 'Female', 'Other', 'Prefer not to say'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.screenWidth(context);
    double screenHeight = ScreenSize.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.arrow_back, color: AppColors.blackColor, size: screenWidth * 0.06)),
                    Text(
                      'My Profile',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: screenWidth * 0.25,
                      height: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.whiteColor, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyColor.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=200&auto=format&fit=crop',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Added Edit Profile Picture Icon
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          // Add functionality to change profile picture
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.red_mainColor2,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child:


                          Icon(
                            Icons.edit,
                            color: AppColors.whiteColor,
                            size: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              buildInputField(context, 'Full Name', _nameController),
              buildInputField(context, 'Email', _emailController, icon: Icons.email_outlined),
              buildInputField(context, 'Phone Number', _phoneController, isPhone: true),
              buildDropdownField(context, 'Gender', _genderOptions, _selectedGender, (newValue) {
                setState(() => _selectedGender = newValue);
              }),
              buildInputField(context, 'Birthdate', _birthdateController),

            ],
          ),
        ),
      ),
    );
  }
}