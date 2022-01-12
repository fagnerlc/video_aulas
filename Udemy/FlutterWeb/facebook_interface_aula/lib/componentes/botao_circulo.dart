import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BotaoCirculo extends StatelessWidget {
  final IconData icone;
  final double iconeTamanho;
  final VoidCallback onPressed;
  const BotaoCirculo({
    Key? key,
    required this.icone,
    required this.iconeTamanho,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icone,
          size: iconeTamanho,
          color: Colors.black,
        ),
      ),
    );
  }
}
