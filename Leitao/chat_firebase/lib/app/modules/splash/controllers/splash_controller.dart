import 'package:chat_firebase/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController({required AuthController? authController})
      : _authController = authController!;
  final AuthController _authController;

  get authController => _authController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
