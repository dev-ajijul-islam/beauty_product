import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_project/routes/app_routes.dart';

class SignInController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  void signIn() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));
      // Perform sign in logic here
      isLoading.value = false;
    }
  }
}
