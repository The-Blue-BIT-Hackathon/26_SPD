import 'package:flutter/material.dart';
import '../../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.text,
    required this.Ttype,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final IconData? icon;
  final String? text;
  final TextInputType Ttype;

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
            const Spacer(),
          ],
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          keyboardType: Ttype,
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
          validator: Ttype != TextInputType.url
              ? (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Details!';
                  }
                  return null;
                }
              : null,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
