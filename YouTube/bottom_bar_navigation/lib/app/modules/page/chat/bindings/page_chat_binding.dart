import 'package:get/get.dart';

import '../controllers/page_chat_controller.dart';

class PageChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageChatController>(
      () => PageChatController(),
    );
  }
}
