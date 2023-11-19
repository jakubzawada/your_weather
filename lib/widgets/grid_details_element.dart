import 'package:flutter/material.dart';

class GridDetailsElement extends StatelessWidget {
  const GridDetailsElement(
      {super.key, required this.imagePath, required this.text});

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 6,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white,
            Color.fromARGB(255, 160, 208, 241),
            Color.fromARGB(255, 137, 202, 245),
          ],
          tileMode: TileMode.mirror,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(4, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image(
              image: AssetImage(imagePath),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
