import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String? initialValue;
  final String labelText;
  final Color? cor;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool suffixIconBool;
  final bool suffixIconObscureTextBool;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function(String?)? onTap;
  final Function()? suffixIconFunction;
  final FormFieldValidator<String>? validatorFunction;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;

  bool obscureText;

  CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    this.suffixIcon,
    this.suffixIconBool = false,
    this.obscureText = false,
    this.suffixIconObscureTextBool = false,
    this.suffixIconFunction,
    this.cor,
    this.validatorFunction,
    this.initialValue,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.keyboardType,
    this.autofillHints,
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
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onEditingComplete: widget.onEditingComplete,
        autofillHints: widget.autofillHints,
        validator: widget.validatorFunction,
        cursorColor: Theme.of(context).primaryColorLight,
        style: TextStyle(color: widget.cor ?? Theme.of(context).primaryColor),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.prefixIcon,
            color: widget.cor ?? Theme.of(context).primaryColor,
          ),
          suffixIcon: widget.suffixIconBool
              ? IconButton(
                  onPressed: widget.suffixIconObscureTextBool
                      ? () {
                          setState(() {
                            widget.obscureText = !widget.obscureText;
                          });
                          debugPrint('${widget.obscureText}');
                        }
                      : widget.suffixIconFunction,
                  icon: widget.suffixIconObscureTextBool
                      ? Icon(
                          widget.obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color:
                              widget.cor ?? Theme.of(context).primaryColorLight,
                        )
                      : Icon(widget.suffixIcon),
                )
              : null,
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: widget.cor ?? Theme.of(context).primaryColorLight),
          isDense: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColorLight,
              width: 3.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21.0),
            borderSide: BorderSide(
              color: widget.cor ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
