import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/core/constants/app_strings.dart';
import 'package:test_project/core/widgets/loading.dart';
import 'package:test_project/features/auth/presentation/widgets/social_login.dart';
import 'package:test_project/utils/validator.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_blob_background_2.dart';
import '../controllers/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController signInController = Get.find<SignInController>();
    return Scaffold(
      body: CustomBlobBackground2(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 250.h),
              Text(AppStrings.login, style: context.textTheme.titleLarge),
              Text(AppStrings.signInMessage),
              Form(
                key: signInController.formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: signInController.emailController,
                      validator: (value) => Validator.email(value),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: AppStrings.email,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => TextFormField(
                        obscureText: !signInController.isPasswordVisible.value,
                        controller: signInController.passwordController,
                        validator: (value) => Validator.password(value),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: signInController.togglePasswordVisibility,
                            child: Icon(
                              signInController.isPasswordVisible.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.grey,
                            ),
                          ),
                          hintText: AppStrings.password,
                        ),
                      ),
                    ),
                    Align(
                      alignment: .topEnd,
                      child: GestureDetector(
                        onTap: () => signInController.goToForgotPassword(),
                        child: Text(
                          AppStrings.forgotPassword,
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    SizedBox(
                      width: 1.sw,
                      height: 50.h,
                      child: Obx(
                        () => FilledButton(
                          onPressed: signInController.signIn,
                          child: signInController.isLoading.value
                              ? const Loading()
                              : Text(AppStrings.login),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Text(AppStrings.orSignInWith),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SocialLogin(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
