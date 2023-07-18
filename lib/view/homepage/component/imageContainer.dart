import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.image,
    required this.deskripsi,
    this.margin = const EdgeInsets.all(0),
  });
  final String image;
  final String deskripsi;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 26, 73, 128),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(image),
            ),
            SizedBox(
              height: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  deskripsi,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
