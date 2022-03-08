import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart' as um;
import 'package:flutter_application_1/pages/main_views/home_with_bottom_navbar.dart';
import 'package:flutter_application_1/pages/phone_input_page.dart';
import 'package:flutter_application_1/pages/registration/get_started.dart';
import 'package:flutter_application_1/repositories/user_repo.dart';
import 'package:flutter_application_1/services/user_service.dart';
import 'package:flutter_application_1/utils/auth_helper.dart';

class SplashPage extends StatelessWidget {
  static const pageName = '/splash';
  @override
  Widget build(BuildContext context) {
    // TODO: refactor
    Future.delayed(Duration(seconds: 3), () async {
      // return;
      UserRepository userRepository = UserRepository(UserService());

      if (AuthHelper.isLoggedIn()) {
        print(FirebaseAuth.instance.currentUser!.uid);
        um.User? user = await userRepository
            .getUser(FirebaseAuth.instance.currentUser!.uid);
        if (user == null) {
          Navigator.pushReplacementNamed(context, GetStartedPage.pageName);
          // Navigator.pushReplacementNamed(context, HomeWithBottomNavBar.pageName);
        } else {
          // check if user has submitted for verification
    
          Navigator.pushReplacementNamed(
              context, HomeWithBottomNavBar.pageName);
        }
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
