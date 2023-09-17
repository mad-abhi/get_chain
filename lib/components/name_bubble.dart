import 'package:flutter/material.dart';

class NameBubble extends StatelessWidget {
  final String message;
  const NameBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 12, color: Colors.black),
      ),
    );
  }
}
