import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/binding/initialBindings.dart';
import 'package:test_project/routes/app_pages.dart';

import 'core/theme/app_theme.dart';
import 'core/constants/app_colors.dart';
import 'routes/app_routes.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        initialBinding: InitialBindings(),
        color: AppColors.white,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        themeMode: .system,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
