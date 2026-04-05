import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/core/constants/app_colors.dart';
import 'package:test_project/core/constants/app_strings.dart';
import 'package:test_project/core/extensions/text_theme_extension.dart';

class CustomDialog {
  CustomDialog._();

  static void showDialog({
    double? height,
    IconData? icon,
    List<Widget> actions = const [],
    required String title,
  }) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.white,
        content: SizedBox(
          height: height != null ? height.h : 0.2.sh,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -40,
                child: Container(
                  padding: .all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey,
                        spreadRadius: 1,
                        offset: Offset(0, 2),
                        blurRadius: 5,
                      ),
                    ],
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child:

                      Icon(
                        icon ?? Icons.check_circle,
                        size: 40,
                        color: AppColors.primaryColor,
                      ),
                ),
              ),
              Column(
                mainAxisAlignment: .spaceBetween,
                children: [
                  SizedBox(height: 25.h),
                  Center(
                    child: Text(
                      title,
                      style: Get.context?.titleMedium,
                      textAlign: .center,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    children: [
                      ...List.generate(
                        actions.length,
                        (index) => Expanded(child: actions[index]),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
