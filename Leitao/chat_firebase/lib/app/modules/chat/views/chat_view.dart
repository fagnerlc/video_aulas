import 'package:chat_firebase/app/data/services/auth/auth_mock_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (() {
            AuthMockService().logout();
          }),
          child: const Text(
            'Logout',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
