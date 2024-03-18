import 'package:flutter/material.dart';

class BoxedTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboard;
  final bool isInputHidden;
  final FocusNode focusNode;

  const BoxedTextField(
      {super.key, required this.controller,
      required this.hint,
      this.isInputHidden = false,
      this.keyboard = TextInputType.text,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      // decoration: InputDecoration(
      //   filled: true,
      //   fillColor: AppColors.white,
      //   hintText: hint,
      //   border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(10),
      //       borderSide: BorderSide(color: AppColors.black)),
      // ),
      controller: controller,
      // obscureText: isInputHidden,
      keyboardType: keyboard,
      focusNode: focusNode,
    );
  }
}
