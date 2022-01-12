import 'package:bottom_bar_navigation/app/modules/home/controllers/home_controller.dart';
import 'package:bottom_bar_navigation/app/modules/page/chat/views/page_chat_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/dashboard/views/page_dashboard_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/profile/views/page_profile_view.dart';
import 'package:bottom_bar_navigation/app/modules/page/setting/views/page_setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    controller.currentScreen = PageDashboardView();
                    controller.currentTab = 0;
                  },
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: controller.currentTab == 0
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Text(
                          'Dashboards',
                          style: TextStyle(
                              color: controller.currentTab == 0
                                  ? Colors.blue
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    controller.currentScreen = PageChatView();
                    controller.currentTab = 1;
                  },
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: controller.currentTab == 1
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Text(
                          'Chat',
                          style: TextStyle(
                              color: controller.currentTab == 1
                                  ? Colors.blue
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    controller.currentScreen = PageProfileView();
                    controller.currentTab = 2;
                  },
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: controller.currentTab == 2
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: controller.currentTab == 2
                                  ? Colors.blue
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    controller.currentScreen = PageSettingView();
                    controller.currentTab = 3;
                  },
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: controller.currentTab == 3
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Text(
                          'Setting',
                          style: TextStyle(
                              color: controller.currentTab == 3
                                  ? Colors.blue
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
