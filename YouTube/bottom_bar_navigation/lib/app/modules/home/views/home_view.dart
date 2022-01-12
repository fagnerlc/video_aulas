import 'package:bottom_bar_navigation/app/modules/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: Obx(
          () => controller.screens[controller.currentTab],
        ),
        bucket: controller.bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
