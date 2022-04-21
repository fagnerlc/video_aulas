import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final IconData? icon;
  final Color? cor;
  final Function()? onPressed;
  const CustomButtonText({
    Key? key,
    this.height,
    this.width,
    required this.text,
    required this.onPressed,
    this.icon,
    this.cor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
