import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:inovasi_budaya/view/homepage/tataNilaiAkhlak.dart';
import 'package:inovasi_budaya/view/homepage/visiMisi.dart';
import 'package:inovasi_budaya/view/homepage/budaya.dart';
import 'package:inovasi_budaya/view/homepage/sekilasInformasi.dart';
import 'package:inovasi_budaya/view/homepage/timInternalisasi.dart';
import 'package:inovasi_budaya/view/homepage/reward.dart';
import 'package:inovasi_budaya/view/homepage/feedbackUser.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var arr = [
    'assets/image/Siapkeakhlak.jpg',
    'assets/image/PosterAkhlak.jpg',
    'assets/image/PosterPerilakuAkhlak.jpg',
    'assets/image/Posterlandscape1.jpg',
    'assets/image/Posterlandscape2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.orange,
            ),
            iconSize: 36,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        backgroundColor: const Color.fromARGB(255, 6, 51, 83),
        title: const Text(
          'Homepage',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      drawer: const BurgerList(),
      body: ListView(
        children: const [
          Akhlak(),
          VisiMisi(),
          InformasiBudaya(),
          SekilasInformasi(),
          TimInternalisasi(),
          Rewards(),
          FeedbackUser(),
        ],
      ),
    );
  }
}
