import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final IconData? icon;
  final Color? cor;
  final Function()? onPressed;

  const CustomButton({
    Key? key,
    this.height = 49,
    this.width = 210,
    required this.text,
    required this.onPressed,
    this.cor,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: text == ''
            ? Icon(icon)
            : Text(
                text,
              ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
