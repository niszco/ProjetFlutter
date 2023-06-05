import 'package:flutter/material.dart';

class QuizzList {
  final String name;
  final String description;

  QuizzList({required this.name, required this.description});
}

class QuizzListChoice extends StatelessWidget {
  const QuizzListChoice({
    Key? key,
    required this.name,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final String description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(60, 255, 166, 0),
            borderRadius: BorderRadius.circular(60),
            border: Border.all(
              style: BorderStyle.solid,
              color: const Color.fromARGB(200, 255, 166, 0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
