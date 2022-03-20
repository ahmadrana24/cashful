import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {
  static String? requiredValidator(value) {
    if (value == null || value == "") {
      return "Field required"; 
    }
    return null;
  }

  static void showSnackBar(String message, context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void setRecurringFalse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("first-time", true);
  }
}
