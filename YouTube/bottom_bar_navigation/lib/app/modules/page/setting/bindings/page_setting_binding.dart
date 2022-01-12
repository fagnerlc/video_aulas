import 'package:get/get.dart';

import '../controllers/page_setting_controller.dart';

class PageSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageSettingController>(
      () => PageSettingController(),
    );
  }
}
