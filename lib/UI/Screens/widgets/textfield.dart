import 'package:flutter/material.dart';
import '../../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.text
  }) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text ?? text!,
              style: kTextPopR14,
            ),
            Spacer(),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: hintText ?? "Enter text here",
            hintStyle: kTextPopR14,
            icon: icon != null ? Icon(icon) : null,
            filled: true,
            fillColor: kbgColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
