import 'package:get/get.dart';
import 'package:test_project/features/splash/presentation/controllers/splash_controller.dart';

import '../../features/auth/presentation/controllers/create_password_controller.dart';
import '../../features/auth/presentation/controllers/forgot_password_controller.dart';
import '../../features/auth/presentation/controllers/sign_in_controller.dart';
import '../../features/auth/presentation/controllers/sign_up_controller.dart';
import '../../features/auth/presentation/controllers/verify_otp_controller.dart';
import '../../features/onboarding/presentation/controllers/onboarding_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => OnboardingController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => ForgotPasswordController());
    Get.lazyPut(() => VerifyOtpController());
    Get.lazyPut(() => CreatePasswordController());
  }
}
