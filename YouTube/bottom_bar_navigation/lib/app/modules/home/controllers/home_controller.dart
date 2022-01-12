import 'package:bottom_bar_navigation/app/modules/page/chat/views/page_chat_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/dashboard/views/page_dashboard_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/profile/views/page_profile_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/setting/views/page_setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt _currentTab = 0.obs;
  List<Widget> _screens = [
    PageDashboardView(),
    PageChatView(),
    PageProfileView(),
    PageSettingView(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentScreen = PageDashboardView().obs();

  get currentScreen => _currentScreen;
  set currentScreen(value) => _currentScreen = value;
  get currentTab => _currentTab.value;
  set currentTab(value) => _currentTab.value = value;
  get screens => _screens;
  set screens(value) => _screens = value;

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
