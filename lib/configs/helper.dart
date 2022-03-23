import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart'
    as permissionHandler;
import 'package:usage_stats/usage_stats.dart';

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

  static Future<bool> permissionsAllowed() async {
    var _storageAllowed = await permissionHandler.Permission.storage.status ==
        permissionHandler.PermissionStatus.granted;
    var _phoneAllowed = await permissionHandler.Permission.phone.status ==
        permissionHandler.PermissionStatus.granted;
    var _smsAllowed = await permissionHandler.Permission.sms.status ==
        permissionHandler.PermissionStatus.granted;
    var _locationAllowed = await permissionHandler.Permission.location.status ==
        permissionHandler.PermissionStatus.granted;
    var _contactsAllowed = await permissionHandler.Permission.contacts.status ==
        permissionHandler.PermissionStatus.granted;
    var _usageAllowed = await UsageStats.checkUsagePermission() ?? false;

    return _contactsAllowed &&
        _locationAllowed &&
        _phoneAllowed &&
        _smsAllowed &&
        _storageAllowed &&
        _usageAllowed;
  }
}
