import 'package:get/get.dart';

import '../controllers/page_dashboard_controller.dart';

class PageDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageDashboardController>(
      () => PageDashboardController(),
    );
  }
}
