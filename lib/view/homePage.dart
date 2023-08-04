// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:inovasi_budaya/view/homepage/tataNilaiAkhlak.dart';
import 'package:inovasi_budaya/view/homepage/visiMisi.dart';
import 'package:inovasi_budaya/view/homepage/budaya.dart';
import 'package:inovasi_budaya/view/homepage/sekilasInformasi.dart';
import 'package:inovasi_budaya/view/homepage/timInternalisasi.dart';
import 'package:inovasi_budaya/view/homepage/reward.dart';
import 'package:inovasi_budaya/view/homepage/feedbackUser.dart';
import 'package:inovasi_budaya/view/homepage/component/circleImageTitle.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "https://django.belajarpro.online/";

  var arr = [
    'assets/image/Siapkeakhlak.jpg',
    'assets/image/PosterAkhlak.jpg',
    'assets/image/PosterPerilakuAkhlak.jpg',
    'assets/image/Posterlandscape1.jpg',
    'assets/image/Posterlandscape2.jpg'
  ];

  dynamic budaya = [];
  List<Widget> timInternal = [];
  dynamic reward = {};
  dynamic budayaNow = {
    "id": 0,
    "judul": "Tidak ada budaya",
    "deskripsi": "Belum ada budaya yang di input untuk bulan ini",
    "tanggal":
        "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, "0")}",
    "created_at": "2023-07-18 01:07:41",
    "updated_at": "2023-07-18 01:07:41"
  };

  void getBudaya() async {
    await http.get(Uri.parse("${url}api/budaya/year/now")).then(
      (response) {
        if (response.statusCode == 200) {
          budaya = jsonDecode(response.body);
          setState(() {
            budaya;
          });
        }
      },
    );
  }

  void getBudayaNow() async {
    try {
      await http.get(Uri.parse("${url}api/budaya/now")).then(
        (response) {
          if (response.statusCode == 200) {
            budayaNow = jsonDecode(response.body);
            setState(() {
              budayaNow;
            });
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getTimInternal() async {
    dynamic tim;
    try {
      await http.get(Uri.parse("${url}api/timInternalisasi")).then(
        (response) {
          if (response.statusCode == 200) {
            tim = jsonDecode(response.body);
          }
          for (var t in tim) {
            timInternal.add(
              Avatar(
                image: "${url}storage/uploaded/user/${t['profilepic']}",
                titleText: t['name'],
                margin: const EdgeInsets.all(10),
                size: 0.3,
                constraint: true,
                network: true,
              ),
            );
          }
          setState(() {
            timInternal;
          });
        },
      );
    } catch (e) {
      tim = [];
    }
  }

  void getReward() async {
    try {
      await http.get(Uri.parse("${url}api/reward/latest")).then(
        (response) {
          if (response.statusCode == 200) {
            reward = jsonDecode(response.body);
            setState(() {
              reward;
            });
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    getBudayaNow();
    getBudaya();
    getTimInternal();
    getReward();
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
          TimInternalisasi(tim: timInternal),
          Rewards(reward: reward),
          const FeedbackUser(),
        ],
      ),
    );
  }
}
