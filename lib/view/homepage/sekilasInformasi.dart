// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/homepage/component/divider.dart';
import 'package:inovasi_budaya/view/homepage/component/iconContainerButton.dart';

// ignore: must_be_immutable
class SekilasInformasi extends StatefulWidget {
  SekilasInformasi({super.key, required this.budayaNow});
  dynamic budayaNow;

  @override
  State<SekilasInformasi> createState() => _SekilasInformasiState();
}

class _SekilasInformasiState extends State<SekilasInformasi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const TextDivider(titleText: 'Sekilas Informasi'),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconContainerButton(
              titleText: "Materi Sharing",
              iconAsset: 'assets/image/Materi_Sharing.png',
              isLeft: true,
              route: "/materi",
            ),
            IconContainerButton(
              titleText: "Kinerja",
              iconAsset: 'assets/image/Kinerja.png',
              isLeft: false,
              route: "/kinerja",
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
              route: "/aktivitas?id=${widget.budayaNow['id']}",
            ),
            const IconContainerButton(
              titleText: "Safety Moment",
              iconAsset: 'assets/image/Safety_Moment.png',
              isLeft: false,
              route: "/safety",
            ),
          ],
        ),
      ],
    );
  }
}
