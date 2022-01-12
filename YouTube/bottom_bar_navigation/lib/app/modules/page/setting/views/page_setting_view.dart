import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/page_setting_controller.dart';

class PageSettingView extends GetView<PageSettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageSettingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PageSettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
