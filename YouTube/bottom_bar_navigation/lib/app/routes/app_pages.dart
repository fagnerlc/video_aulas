import 'package:get/get.dart';

import 'package:bottom_bar_navigation/app/modules/home/bindings/home_binding.dart';
import 'package:bottom_bar_navigation/app/modules/home/views/home_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/chat/bindings/page_chat_binding.dart';
import 'package:bottom_bar_navigation/app/modules/page/chat/views/page_chat_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/dashboard/bindings/page_dashboard_binding.dart';
import 'package:bottom_bar_navigation/app/modules/page/dashboard/views/page_dashboard_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/profile/bindings/page_profile_binding.dart';
import 'package:bottom_bar_navigation/app/modules/page/profile/views/page_profile_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/setting/bindings/page_setting_binding.dart';
import 'package:bottom_bar_navigation/app/modules/page/setting/views/page_setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PAGE_DASHBOARD,
      page: () => PageDashboardView(),
      binding: PageDashboardBinding(),
    ),
    GetPage(
      name: _Paths.PAGE_CHAT,
      page: () => PageChatView(),
      binding: PageChatBinding(),
    ),
    GetPage(
      name: _Paths.PAGE_PROFILE,
      page: () => PageProfileView(),
      binding: PageProfileBinding(),
    ),
    GetPage(
      name: _Paths.PAGE_SETTING,
      page: () => PageSettingView(),
      binding: PageSettingBinding(),
    ),
  ];
}
