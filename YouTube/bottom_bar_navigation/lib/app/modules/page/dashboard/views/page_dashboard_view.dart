import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/page_dashboard_controller.dart';

class PageDashboardView extends GetView<PageDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageDashboardView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PageDashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
