import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_assets.dart';

class CustomBlobBackground2 extends StatelessWidget {
  const CustomBlobBackground2({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(child: SvgPicture.asset(AppAssets.blob3)),
        Positioned(left: 0, top: 0, child: SvgPicture.asset(AppAssets.blob4)),
        Positioned(
          right: 0,
          top: 170.h,
          child: SvgPicture.asset(AppAssets.blob5),
        ),
        SizedBox(width: 1.sw, child: child),
      ],
    );
  }
}
