import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/localstorage/app_local_storage.dart';
import 'package:bookingapp/core/routing/app_routes.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class AppHeleperFunctions {
  static String formatEventDate(String rawDate, {String? format}) {
    try {
      DateTime dateTime = DateTime.parse(rawDate);

      String formattedDate = DateFormat(
        format ?? 'E, MMM d • h:mm a',
      ).format(dateTime);
      return formattedDate;
    } catch (e) {
      return rawDate;
    }
  }

  //  Validate name
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }
    List<String> words = value.trim().split(RegExp(r'\s+'));
    if (words.length < 3) {
      return 'Full name must contain at least 3 words';
    }
    return null;
  }

  //  Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  //  Validate Password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  //validateConfirmPassword
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String getinialRoutes() {
    var route = AppHiveLocalStorage.getBool(AppSavedKey.onBorading,Hive.box(AppSavedKey.intialRoute));
    if (route) {
      print("route");
      print(route);
      return AppRoutes.loginScreen;
    } else {
      return AppRoutes.splashScreen;
    }
  }
}
