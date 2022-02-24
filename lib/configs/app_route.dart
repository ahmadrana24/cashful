import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/pages/main_views/home_with_bottom_navbar.dart';
import 'package:flutter_application_1/pages/otp_ver_page.dart';
import 'package:flutter_application_1/pages/phone_input_page.dart';
import 'package:flutter_application_1/pages/splash_page.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
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
      default:
        return _materialPageRoute(SplashPage());
    }
  }

  static _materialPageRoute(Widget screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }
}
