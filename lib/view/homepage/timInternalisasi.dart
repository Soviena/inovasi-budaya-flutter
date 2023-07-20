import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/homepage/component/divider.dart';
import 'package:inovasi_budaya/view/homepage/component/circleImageTitle.dart';

class TimInternalisasi extends StatelessWidget {
  const TimInternalisasi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      TextDivider(titleText: 'Tim Internalisasi'),
      Wrap(
        alignment: WrapAlignment.spaceAround,
        children: [
          Avatar(
            image: "assets/image/Pengujian.png",
            titleText: "Nama",
            margin: EdgeInsets.all(10),
            size: 0.3,
            constraint: true,
          ),
          Avatar(
            image: "assets/image/Pengujian.png",
            titleText: "Nama",
            margin: EdgeInsets.all(10),
            size: 0.3,
            constraint: true,
          ),
          Avatar(
            image: "assets/image/Pengujian.png",
            titleText: "Nama",
            margin: EdgeInsets.all(10),
            size: 0.3,
            constraint: true,
          ),
          Avatar(
            image: "assets/image/Pengujian.png",
            titleText: "Nama",
            margin: EdgeInsets.all(10),
            size: 0.3,
            constraint: true,
          ),
          Avatar(
            image: "assets/image/Pengujian.png",
            titleText: "Nama",
            margin: EdgeInsets.all(10),
            size: 0.3,
            constraint: true,
          ),
          Avatar(
            image: "assets/image/Pengujian.png",
            titleText: "Nama",
            margin: EdgeInsets.all(10),
            size: 0.3,
            constraint: true,
          ),
          Avatar(
            image: "assets/image/Pengujian.png",
            titleText: "Nama",
            margin: EdgeInsets.all(10),
            size: 0.3,
            constraint: true,
          ),
          Avatar(
            image: "assets/image/Pengujian.png",
            titleText: "Nama",
            margin: EdgeInsets.all(10),
            size: 0.3,
            constraint: true,
          ),
        ],
      ),
    ]);
  }
}
