import 'package:flutter/material.dart';

class Akhlak extends StatelessWidget {
  const Akhlak({super.key});

  void posterAkhlak(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: const Color.fromARGB(255, 6, 51, 83),
          content: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('assets/image/PosterPerilakuAkhlak.jpg'),
                );
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('assets/image/PosterPerilakuAkhlak.jpg'),
                );
              }
            },
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
            'Sucofindo',
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 26, 73, 128),
            ),
          ),
          const Text(
            'Ber-AKHLAK',
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
