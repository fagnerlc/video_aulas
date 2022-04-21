import 'package:chat_firebase/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserImagePicker extends GetView<AuthController> {
  const UserImagePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              backgroundImage: controller.authFormData.image != null
                  ? FileImage(controller.authFormData.image!)
                  : null,
            )),
        TextButton(
          onPressed: controller.pickImage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10),
              const Text('Adicionar Imagem'),
            ],
          ),
        )
      ],
    );
  }
}
