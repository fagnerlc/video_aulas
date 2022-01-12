import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/page_chat_controller.dart';

class PageChatView extends GetView<PageChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PageChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
