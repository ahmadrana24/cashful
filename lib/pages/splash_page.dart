import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/main_views/home_with_bottom_navbar.dart';
import 'package:flutter_application_1/pages/phone_input_page.dart';
import 'package:flutter_application_1/utils/auth_helper.dart';

class SplashPage extends StatelessWidget {
  static const pageName = '/splash';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // return;
      if (AuthHelper.isLoggedIn()) {
        Navigator.pushReplacementNamed(context, HomeWithBottomNavBar.pageName);
      } else {
        // Navigator.pushReplacementNamed(context, LoginScreen.pageName);
        Navigator.pushReplacementNamed(context, PhoneInputPage.pageName);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/app_logo_with_text.png",
          width: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
