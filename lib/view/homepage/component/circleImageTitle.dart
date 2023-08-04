// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.image,
    required this.titleText,
    this.margin = const EdgeInsets.all(0),
    this.size = 0.2,
    this.constraint = false,
    this.network = false,
  });
  final String image;
  final String titleText;
  final EdgeInsetsGeometry margin;
  final double size;
  final bool constraint;
  final bool network;

  Widget imageContainer(network) {
    if (network) {
      return Image.network(
        image,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        image,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxW = double.infinity;
    if (constraint) {
      maxW = size;
    }
    return Container(
      margin: margin,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 3),
                borderRadius: BorderRadius.circular(100)),
            width: MediaQuery.of(context).size.width * size,
            height: MediaQuery.of(context).size.width * size,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: imageContainer(network)),
          ),
          Container(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * size,
              maxWidth: MediaQuery.of(context).size.width * maxW,
            ),
            height: 25,
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
