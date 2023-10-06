import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.grey,
      content: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    ),
  );
}
