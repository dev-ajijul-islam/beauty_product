import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class VerifyOtpController extends GetxController {
  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  final TextEditingController pinCodeController = TextEditingController();

  @override
  void dispose() {
    pinCodeController.dispose();
    super.dispose();
  }

  void verifyOTP() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));
      // Perform sign in logic here
      isLoading.value = false;
      Get.toNamed(AppRoutes.createPassword);
    }
  }
}
