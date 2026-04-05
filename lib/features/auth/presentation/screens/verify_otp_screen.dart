import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_project/core/constants/app_colors.dart';
import '../../../../core/widgets/loading.dart';
import '../controllers/verify_otp_controller.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/widgets/custom_blob_background_4.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyOtpController verifyOtpController =
        Get.find<VerifyOtpController>();
    return Scaffold(
      body: CustomBlobBackground4(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Spacer(),
              Text("Verify OTP", style: context.titleLarge),
              Text("Enter the OTP sent to your email"),
              SizedBox(height: 20.h),
              Form(
                key: verifyOtpController.formKey,
                child: Column(
                  children: [
                    MaterialPinField(
                      pinController: PinInputController(
                        textController: verifyOtpController.pinCodeController,
                      ),
                      keyboardType: TextInputType.number,
                      length: 4,
                      onCompleted: (pin) => print('PIN: $pin'),
                      onChanged: (value) => print('Changed: $value'),
                      theme: MaterialPinTheme(
                        boxShadows: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            color: Colors.black12,
                            blurRadius: 2,
                          ),
                        ],
                        fillColor: AppColors.lightGrey,
                        shape: MaterialPinShape.filled,
                        cellSize: Size(0.2.sw, 64),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: .topEnd,
                      child: Text(
                        AppStrings.resendOtp,
                        style: context.bodyMedium,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: 1.sw,
                      height: 50.h,
                      child: Obx(
                        () => FilledButton(
                          onPressed: verifyOtpController.verifyOTP,

                          child: verifyOtpController.isLoading.value
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
