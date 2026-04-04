import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project/core/constants/app_assets.dart';
import 'package:test_project/routes/app_routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_blob_background_1.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBlobBackground1(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: .start,
              children: [
                Spacer(),
                Image.asset(AppAssets.appLogo),
                Text(
                  AppStrings.onboardingMessage,
                  textAlign: .center,
                  style: context.textTheme.bodyMedium,
                ),
                Spacer(),
                SizedBox(
                  width: 1.sw,
                  height: 50.h,
                  child: FilledButton(
                    onPressed: _getStarted,
                    child: Text(AppStrings.getStarted),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .center,
                  children: [
                    Text(
                      AppStrings.alreadyHaveAnAccount,
                      style: context.textTheme.bodyMedium,
                    ),
                    IconButton(
                      onPressed: _goToLogin,
                      icon: Icon(Icons.arrow_forward_sharp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getStarted() {
    Get.toNamed(AppRoutes.signUp);
  }

  void _goToLogin(){
    Get.toNamed(AppRoutes.signIn);
  }
}
