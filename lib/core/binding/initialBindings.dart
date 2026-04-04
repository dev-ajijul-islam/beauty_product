import 'package:get/get.dart';
import 'package:test_project/features/splash/presentation/controllers/splash_controller.dart';

import '../../features/auth/presentation/controllers/sign_up_controller.dart';
import '../../features/onboarding/presentation/controllers/onboarding_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => OnboardingController());
    Get.lazyPut(() => SignUpController());
  }
}
