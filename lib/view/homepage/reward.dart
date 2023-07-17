import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/homepage/component/divider.dart';
import 'package:inovasi_budaya/view/homepage/component/rewardContainer.dart';

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextDivider(titleText: "Rewards"),
        RewardContainer(
            nama: "Nama Pengguna",
            deskripsi: "Deskripsi penghargaan",
            image: "assets/image/Pengujian.png"),
        RewardContainer(
            nama: "Nama Pengguna",
            deskripsi: "Deskripsi penghargaan",
            image: "assets/image/Pengujian.png"),
        RewardContainer(
            nama: "Nama Pengguna",
            deskripsi: "Deskripsi penghargaan",
            image: "assets/image/Pengujian.png"),
      ],
    );
  }
}
