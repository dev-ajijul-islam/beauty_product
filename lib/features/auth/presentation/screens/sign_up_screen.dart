import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/widgets/loading.dart';
import '../controllers/sign_up_controller.dart';
import '../../../../utils/validator.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_blob_background_1.dart';
import '../widgets/social_login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.find<SignUpController>();
    return Scaffold(
      body: CustomBlobBackground1(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              spacing: 5,
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 50.h),
                Text(
                  AppStrings.createAnAccount,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  textAlign: .start,
                ),
                SizedBox(height: 10.h),
                Column(
                  spacing: 10,
                  children: [
                    SvgPicture.asset(AppAssets.cameraSvg),
                    Text(AppStrings.uploadImage),
                  ],
                ),
                SizedBox(height: 20.h),
                Form(
                  key: signUpController.formKey,
                  child: Column(
                    spacing: 10,
                    children: [
                      TextFormField(
                        validator: (value) => Validator.name(value),
                        controller: signUpController.fullNameController,
                        decoration: InputDecoration(
                          labelText: AppStrings.fullName,
                        ),
                      ),
                      TextFormField(
                        validator: (value) => Validator.email(value),
                        controller: signUpController.emailController,
                        decoration: InputDecoration(
                          labelText: AppStrings.email,
                        ),
                      ),
                      Obx(
                        () => TextFormField(
                          obscureText:
                              !signUpController.isPasswordVisible.value,
                          validator: (value) => Validator.password(value),
                          controller: signUpController.passwordController,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: signUpController.togglePasswordVisibility,
                              child: Icon(
                                signUpController.isPasswordVisible.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppColors.grey,
                              ),
                            ),
                            labelText: AppStrings.password,
                          ),
                        ),
                      ),
                      Obx(
                        () => TextFormField(
                          obscureText:
                              !signUpController.isPasswordVisible.value,
                          validator: (value) => Validator.confirmPassword(
                            value: value!,
                            passwordController:
                                signUpController.passwordController,
                          ),
                          controller:
                              signUpController.confirmPasswordController,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: signUpController.togglePasswordVisibility,
                              child: Icon(
                                signUpController.isPasswordVisible.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppColors.grey,
                              ),
                            ),
                            labelText: AppStrings.confirmPassword,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      InternationalPhoneNumberInput(
                        validator: (value) => Validator.required(value),
                        initialValue: PhoneNumber(isoCode: 'BD'),
                        textFieldController:
                            signUpController.phoneNumberController,
                        selectorConfig: SelectorConfig(
                          trailingSpace: false,
                          selectorType: .BOTTOM_SHEET,
                          leadingPadding: 0,
                        ),
                        inputDecoration: InputDecoration(
                          labelText: AppStrings.phoneNumber,
                        ),
                        onInputChanged: (value) {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  height: 50.h,
                  child: Obx(
                    () => FilledButton(
                      onPressed: signUpController.signUp,
                      child: !signUpController.isLoading.value
                          ? Text(
                              AppStrings.signUp,
                              style: TextStyle(fontSize: 16.sp),
                            )
                          : const Loading(),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  spacing: 15.w,
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .center,
                  children: [
                    Expanded(child: Divider()),
                    Text(AppStrings.orSignInWith),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 15.h),
                SocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
