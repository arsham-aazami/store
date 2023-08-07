import 'package:flutter/material.dart';
import '../consts.dart';

class CustomInput extends StatelessWidget {
  final String? inputText;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final bool checkPassword;

  const CustomInput(
      {required this.inputText,
      super.key,
      required this.onChanged,
      required this.onSubmit,
      required this.checkPassword, });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Consts.colorStyleTwo),
      child: TextField(
        onChanged: onChanged,
        obscureText: checkPassword,
        decoration: InputDecoration(
            hintText: inputText,
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 22)),
      ),
    );
  }
}
