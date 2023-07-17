import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/homepage/component/divider.dart';
import 'package:inovasi_budaya/view/homepage/component/iconContainerButton.dart';

class SekilasInformasi extends StatelessWidget {
  const SekilasInformasi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextDivider(titleText: 'Sekilas Informasi'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconContainerButton(
              titleText: "Materi Sharing",
              iconAsset: 'assets/image/Materi_Sharing.png',
              isLeft: true,
            ),
            IconContainerButton(
              titleText: "Kinerja",
              iconAsset: 'assets/image/Kinerja.png',
              isLeft: false,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconContainerButton(
              titleText: "Aktivitas",
              iconAsset: 'assets/image/Aktivitas.png',
              isLeft: true,
            ),
            IconContainerButton(
              titleText: "Safety Moment",
              iconAsset: 'assets/image/Safety_Moment.png',
              isLeft: false,
            ),
          ],
        ),
      ],
    );
  }
}
