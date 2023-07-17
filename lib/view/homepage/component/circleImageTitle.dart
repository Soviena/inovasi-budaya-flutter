import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.image,
    required this.titleText,
    this.margin = const EdgeInsets.all(0),
    this.size = 0.2,
  });
  final String image;
  final String titleText;
  final EdgeInsetsGeometry margin;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * size,
            height: MediaQuery.of(context).size.width * size,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * size,
            height: 25,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 73, 128),
              borderRadius: BorderRadius.circular(12.5),
              border: Border.all(
                color: Colors.orange,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                titleText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
