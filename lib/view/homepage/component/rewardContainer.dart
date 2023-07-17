import 'package:flutter/material.dart';

class RewardContainer extends StatelessWidget {
  const RewardContainer(
      {super.key,
      required this.nama,
      required this.deskripsi,
      required this.image});
  final String nama;
  final String deskripsi;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 25),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.orange,
          width: 2,
        ),
        color: const Color.fromARGB(255, 6, 52, 83),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 18.0)),
          Text(
            nama,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            deskripsi,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
