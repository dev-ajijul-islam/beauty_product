import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void forgotPassword() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));
      // Perform sign in logic here
      isLoading.value = false;
      Get.toNamed(AppRoutes.verifyOtp);
    }
  }
}
