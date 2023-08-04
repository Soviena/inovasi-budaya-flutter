// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/homepage/component/divider.dart';

class TimInternalisasi extends StatelessWidget {
  const TimInternalisasi({super.key, this.tim = const []});
  final List<Widget> tim;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const TextDivider(titleText: 'Tim Internalisasi'),
      Wrap(
        alignment: WrapAlignment.spaceAround,
        children: tim,
      ),
    ]);
  }
}
