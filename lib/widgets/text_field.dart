import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  String? hint;
  bool isPassword;
  bool passwordVisible = false;
  Color fillColor  ;

  CustomTextField(this.controller,
      {this.hint = '', this.isPassword = false, this.fillColor = Colors.white, Key? key})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: widget.controller,
      autofocus: false,
      obscureText: widget.passwordVisible,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hint,
        contentPadding: const EdgeInsets.only(
            left: 14.0, bottom: 12.0, top: 12.0, right: 8.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide.none,
        ),
        fillColor: widget.fillColor,
        suffixIcon: !widget.isPassword
            ? null
            : IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            widget.passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              widget.passwordVisible = !widget.passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
