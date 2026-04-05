import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/core/constants/app_colors.dart';
import 'package:test_project/core/constants/app_strings.dart';
import 'package:test_project/core/extensions/text_theme_extension.dart';
import 'package:test_project/core/widgets/custom_blob_background_1.dart';
import 'package:test_project/utils/validator.dart';

import '../../../../core/widgets/loading.dart';
import '../controllers/create_password_controller.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreatePasswordController createPasswordController =
        Get.find<CreatePasswordController>();
    return Scaffold(
      body: CustomBlobBackground1(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Spacer(),
              Text(
                AppStrings.createPassword,
                style: context.titleLarge,
                textAlign: .start,
              ),
              SizedBox(height: 20.h),
              Form(
                key: createPasswordController.formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    TextFormField(
                      controller: createPasswordController.passwordController,
                      validator: (value) => Validator.password(value),
                      decoration: InputDecoration(
                        labelText: AppStrings.password,
                        suffixIcon: GestureDetector(
                          child: Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller:
                          createPasswordController.confirmPasswordController,
                      validator: (value) => Validator.confirmPassword(
                        value: value,
                        passwordController:
                            createPasswordController.passwordController,
                      ),
                      decoration: InputDecoration(
                        labelText: AppStrings.confirmPassword,
                        suffixIcon: GestureDetector(
                          child: Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 1.sw,
                      height: 50.h,
                      child: Obx(
                        () => FilledButton(
                          onPressed: createPasswordController.createPassword,
                          child: createPasswordController.isLoading.value
                              ? const Loading()
                              : Text(AppStrings.confirmPassword),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
