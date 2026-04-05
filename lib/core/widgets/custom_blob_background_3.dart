import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_assets.dart';

class CustomBlobBackground3 extends StatelessWidget {
  const CustomBlobBackground3({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(top: 0, right: 0, child: SvgPicture.asset(AppAssets.blob6)),
        Positioned(right: 0, top: 0, child: SvgPicture.asset(AppAssets.blob7)),
        SizedBox(width: 1.sw, child: child),
      ],
    );
  }
}
