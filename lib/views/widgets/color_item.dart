import 'package:flutter/material.dart';

class Coloritems extends StatelessWidget {
  const Coloritems({super.key, required this.color, required this.isActive});

  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}
