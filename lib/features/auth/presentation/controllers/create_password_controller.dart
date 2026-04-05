import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/core/constants/app_strings.dart';
import 'package:test_project/core/widgets/custom_dialog.dart';

class CreatePasswordController extends GetxController {
  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void createPassword() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));

      isLoading.value = false;
      CustomDialog.showDialog(
        icon: Icons.eighteen_mp,
        title: AppStrings.changePasswordSuccessMessage,
        actions: [
          SizedBox(
            width: 1.sw,
            height: 50.h,
            child: FilledButton(onPressed: () {}, child: Text("Ok")),
          ),
        ],
      );
    }
  }
}
