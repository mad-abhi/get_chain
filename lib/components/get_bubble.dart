import 'package:flutter/material.dart';

class GetBubble extends StatelessWidget {
  final String message;
  const GetBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.orange,
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
