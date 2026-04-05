import 'package:get/get.dart';

import '../features/auth/presentation/screens/create_password_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/verify_otp_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.signUp, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.signIn, page: () => SignInScreen()),
    GetPage(name: AppRoutes.forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: AppRoutes.verifyOtp, page: () => VerifyOtpScreen()),
     GetPage(name: AppRoutes.createPassword, page: () => CreatePasswordScreen()),
  ];
}
