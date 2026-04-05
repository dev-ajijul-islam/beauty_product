import 'package:flutter/cupertino.dart';
import 'package:test_project/core/constants/app_strings.dart';

class Validator {
  Validator._();

  static final emailRegexp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  static final passRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.thisFieldIsRequired;
    } else {
      return null;
    }
  }

  static String? name(String? value) {
    final String? error = required(value);
    if (error != null) {
      return error;
    } else {
      return null;
    }
  }

  static String? email(String? value) {
    final String? error = required(value);
    if (error != null) {
      return error;
    } else if ( value != null && !emailRegexp.hasMatch(value)) {
      return AppStrings.enterCorrectEmail;
    } else {
      return null;
    }
  }

  static String? password(String? value) {
    final error = required(value);

    if (error != null) {
      return error;
    } else if (value == null || !passRegExp.hasMatch(value)) {
      return AppStrings.passwordMustBeEightChar;
    } else {
      return null;
    }
  }

  static String? confirmPassword({
    required String? value,
    required TextEditingController passwordController,
  }) {
    final error = required(value);

    if (error != null) {
      return error;
    } else if (value != passwordController.text) {
      return AppStrings.passwordMustBeEightChar;
    } else {
      return null;
    }
  }
}
