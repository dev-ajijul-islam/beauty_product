import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_blob_background_3.dart';
import '../../../../core/widgets/loading.dart';
import '../../../../utils/validator.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController forgotPasswordController =
        Get.find<ForgotPasswordController>();
    return Scaffold(
      body: CustomBlobBackground3(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Spacer(),
              Text(
                AppStrings.forgotPassword,
                style: context.textTheme.titleLarge,
              ),
              Text(AppStrings.forgotPasswordMessage),
              SizedBox(height: 20.h),
              Form(
                key: forgotPasswordController.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: forgotPasswordController.emailController,
                      validator: (value) => Validator.email(value),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: AppStrings.email,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => SizedBox(
                        width: 1.sw,
                        height: 50.h,
                        child: FilledButton(
                          onPressed: forgotPasswordController.forgotPassword,
                          child: forgotPasswordController.isLoading.value
                              ? const Loading()
                              : Text(AppStrings.continueText),
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
