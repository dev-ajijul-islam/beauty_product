import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30.w,
      mainAxisAlignment: .center,
      children: [
        Container(
          padding: .all(10),
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: .circular(10),
            boxShadow: [
              BoxShadow(color: AppColors.grey, spreadRadius: 1, blurRadius: 2),
            ],
          ),
          child: SvgPicture.asset(AppAssets.googleLogoSvg),
        ),
        Container(
          padding: .all(10),
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: .circular(10),
            boxShadow: [
              BoxShadow(color: AppColors.grey, spreadRadius: 1, blurRadius: 2),
            ],
          ),
          child: SvgPicture.asset(AppAssets.appleLogoSvg),
        ),
      ],
    );
  }
}
