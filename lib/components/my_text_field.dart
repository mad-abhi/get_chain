import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hindText;
  final bool obscureText;
  MyTextField({
    required this.controller,
    required this.hindText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.grey[100],
        filled: true,
        hintText: hindText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
