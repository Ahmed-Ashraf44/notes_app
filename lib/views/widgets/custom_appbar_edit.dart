import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_search_icon.dart';

class CustomAppBarEdit extends StatelessWidget {
  const CustomAppBarEdit(
      {super.key, required this.title, required this.icon, this.onPressed});

  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 30),
          ),
          const Spacer(),
          CustomIcon(
            icon: icon,
            onPressed: onPressed,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
