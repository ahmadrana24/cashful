import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/pages/apply/apply_final_step.dart';
import 'package:flutter_application_1/pages/apply/first_time/apply_splash.dart';
import 'package:flutter_application_1/pages/main_views/home_with_bottom_navbar.dart';
import 'package:flutter_application_1/pages/otp_ver_page.dart';
import 'package:flutter_application_1/pages/phone_input_page.dart';
import 'package:flutter_application_1/pages/registration/get_started.dart';
import 'package:flutter_application_1/pages/registration/verification.dart';
import 'package:flutter_application_1/pages/registration/verification2.dart';
import 'package:flutter_application_1/pages/registration/verification3.dart';
import 'package:flutter_application_1/pages/registration/verification4.dart';
import 'package:flutter_application_1/pages/splash_page.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GetStartedPage.pageName:
        return _materialPageRoute(GetStartedPage());
      case SplashPage.pageName:
        return _materialPageRoute(SplashPage());
      case HomeWithBottomNavBar.pageName:
        return _materialPageRoute(HomeWithBottomNavBar());
      case LoginScreen.pageName:
        return _materialPageRoute(LoginScreen());
      case PhoneInputPage.pageName:
        return _materialPageRoute(PhoneInputPage());
      case OTPVerificationPage.pageName:
        return _materialPageRoute(OTPVerificationPage());
      case VerificationPage.pageName:
        return _materialPageRoute(VerificationPage());
      case VerificationPage2.pageName:
        return _materialPageRoute(VerificationPage2());
      case VerificationPage2.pageName:
        return _materialPageRoute(VerificationPage2());
      case VerificationPage3.pageName:
        return _materialPageRoute(VerificationPage3());
      case VerificationPage4.pageName:
        return _materialPageRoute(VerificationPage4());
      case ApplySplash.pageName:
        return _materialPageRoute(ApplySplash());
      case ApplyFinalStep.pageName:
        return _materialPageRoute(ApplyFinalStep());
      default:
        return _materialPageRoute(SplashPage());
    }
  }

  static _materialPageRoute(Widget screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }
}
