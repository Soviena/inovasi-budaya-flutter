import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:inovasi_budaya/view/homepage/tataNilaiAkhlak.dart';
import 'package:inovasi_budaya/view/homepage/visiMisi.dart';
import 'package:inovasi_budaya/view/homepage/budaya.dart';
import 'package:inovasi_budaya/view/homepage/sekilasInformasi.dart';
import 'package:inovasi_budaya/view/homepage/timInternalisasi.dart';
import 'package:inovasi_budaya/view/homepage/reward.dart';
import 'package:inovasi_budaya/view/homepage/feedbackUser.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "http://192.168.1.124:8000/";

  var arr = [
    'assets/image/Siapkeakhlak.jpg',
    'assets/image/PosterAkhlak.jpg',
    'assets/image/PosterPerilakuAkhlak.jpg',
    'assets/image/Posterlandscape1.jpg',
    'assets/image/Posterlandscape2.jpg'
  ];

  dynamic budaya = [];
  dynamic budayaNow = {
    "id": 0,
    "judul": "Loading",
    "deskripsi": "Loading",
    "tanggal": "2023-07",
    "created_at": "2023-07-18 01:07:41",
    "updated_at": "2023-07-18 01:07:41"
  };

  void getBudaya() async {
    await http.get(Uri.parse("${url}api/budaya/year/now")).then(
      (response) {
        if (response.statusCode == 200) {
          budaya = jsonDecode(response.body);
        }
        setState(() {
          budaya;
        });
      },
    );
  }

  void getBudayaNow() async {
    await http.get(Uri.parse("${url}api/budaya/now")).then(
      (response) {
        if (response.statusCode == 200) {
          budayaNow = jsonDecode(response.body);
        }
        setState(() {
          budayaNow;
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getBudayaNow();
    getBudaya();
    super.initState();
  }

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
        children: [
          const Akhlak(),
          const VisiMisi(),
          InformasiBudaya(
            budaya: budaya,
            budayaNow: budayaNow,
          ),
          SekilasInformasi(
            budayaNow: budayaNow,
          ),
          const TimInternalisasi(),
          const Rewards(),
          const FeedbackUser(),
        ],
      ),
    );
  }
}
