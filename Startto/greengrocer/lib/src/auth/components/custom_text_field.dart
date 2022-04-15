import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String labelText;
  final bool suffixIconBool;
  bool obscureText;

  CustomTextField({
    Key? key,
    required this.icon,
    required this.labelText,
    this.suffixIconBool = false,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.suffixIconBool
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                      debugPrint('${widget.obscureText}');
                    },
                    icon: Icon(widget.obscureText
                        ? Icons.visibility
                        : Icons.visibility_off))
                : null,
            labelText: widget.labelText,
            isDense: false,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      ),
    );
  }
}
