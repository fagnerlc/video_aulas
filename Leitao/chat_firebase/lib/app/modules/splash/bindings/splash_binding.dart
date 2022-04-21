import 'package:chat_firebase/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
