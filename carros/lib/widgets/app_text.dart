import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  AppText(
    this.label,
    this.hint, {
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: TextStyle(
        fontSize: 21,
        color: Colors.brown,
      ),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          //hoverColor: Colors.black,
          //fillColor: Colors.black,
          //focusColor: Colors.black,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 25,
            color: Colors.brown,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.brown,
          )),
    );
  }
}
