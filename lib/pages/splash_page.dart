import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/firebase_helper.dart';
import 'package:flutter_application_1/configs/locator.dart';
import 'package:flutter_application_1/pages/base_view.dart';
import 'package:flutter_application_1/pages/main_views/home_with_bottom_navbar.dart';
import 'package:flutter_application_1/pages/phone_input_page.dart';
import 'package:flutter_application_1/pages/registration/get_started.dart';
import 'package:flutter_application_1/pages/registration/verification.dart';
import 'package:flutter_application_1/pages/registration/verification2.dart';
import 'package:flutter_application_1/pages/registration/verification3.dart';
import 'package:flutter_application_1/pages/registration/verification4.dart';
import 'package:flutter_application_1/view_models/base_view_model.dart';
import 'package:flutter_application_1/view_models/splash_view_model.dart';
import 'package:flutter_application_1/view_models/user_view_model.dart';

class SplashPage extends StatelessWidget {
  static const pageName = '/splash';
  User? user;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BaseView<SplashViewModel>(
        onModelReady: (model) {
          model.getUser();
        },
        builder: (context, model, child) {
          if (model.state == ViewState.Idle && model.errorMessage != null) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Something went wrong"),
                action: SnackBarAction(
                  label: "try again",
                  onPressed: () {
                    model.getUser();
                  },
                ),
              ));
            });
          } else if (model.state == ViewState.Idle) {
            // get user from model
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              var user = model.user;
              if (user == null) {
                // user is new user so register
                Navigator.pushReplacementNamed(
                    context, GetStartedPage.pageName);
                return;
              }
              print(user.toMap());
              if (user.verificationDocuments != null) {
                if (user.verificationDocuments!.idCard == null) {
                  Navigator.pushReplacementNamed(
                      context, VerificationPage.pageName);
                } else if (user.verificationDocuments!.bankStatement == null) {
                  Navigator.pushReplacementNamed(
                      context, VerificationPage2.pageName);
                } else if (user.verificationDocuments!.proofOfAddress == null) {
                  Navigator.pushReplacementNamed(
                      context, VerificationPage3.pageName);
                } else if (user.bankDetail == null && user.mtnDetail == null) {
                  Navigator.pushReplacementNamed(
                      context, VerificationPage4.pageName);
                } else {
                  locator<UserViewModel>().user = user;
                  Navigator.pushReplacementNamed(
                      context, HomeWithBottomNavBar.pageName);
                }
              }
            });
          }

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
        },
      );
    });
  }
}
