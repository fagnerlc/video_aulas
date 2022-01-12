import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/page_profile_controller.dart';

class PageProfileView extends GetView<PageProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PageProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
