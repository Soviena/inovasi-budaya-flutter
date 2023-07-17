import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.image, required this.titleText});
  final String image;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
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
    );
  }
}
