// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';

class Akhlak extends StatefulWidget {
  const Akhlak({super.key});

  @override
  State<Akhlak> createState() => _AkhlakState();
}

class _AkhlakState extends State<Akhlak> {
  List<String> image = [
    "assets/image/PosterPerilakuAkhlak.jpg",
    "assets/image/PosterAkhlak.jpg",
    "assets/image/Siapkeakhlak.jpg",
    "assets/image/PosterAkhlak.jpg",
    "assets/image/Posterlandscape1.jpg",
    "assets/image/Posterlandscape2.jpg"
  ];
  int akhlakImage = 0;

  Future<void> posterAkhlak(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: const Color.fromARGB(255, 6, 51, 83),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Container(
            alignment: Alignment.center,
            child: const Text(
              "<< Swipe >>",
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: InteractiveViewer(
            maxScale: 10,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  // Swiping in right direction.
                  if (details.primaryVelocity! > 0) {
                    akhlakImage++;
                    if (akhlakImage >= image.length) {
                      akhlakImage -= image.length;
                    }
                    setState(() {
                      akhlakImage;
                      Navigator.pop(context);
                      posterAkhlak(context);
                    });
                  }
                  // Swiping in left direction.
                  if (details.primaryVelocity! < 0) {
                    akhlakImage--;
                    if (akhlakImage < 0) {
                      akhlakImage += image.length;
                    }
                    setState(() {
                      akhlakImage;
                      Navigator.pop(context);
                      posterAkhlak(context);
                    });
                  }
                },
                child: Image.asset(image[akhlakImage]),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SUCOFINDO',
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 26, 73, 128),
            ),
          ),
          const Text(
            'BER-AKHLAK',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 2, 124, 204),
            ),
          ),
          const SizedBox(height: 16.0),
          Image.asset(
            'assets/image/Akhlak.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 2, 33, 204),
                  Color.fromARGB(255, 95, 220, 216)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                posterAkhlak(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Tata Nilai Akhlak',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
