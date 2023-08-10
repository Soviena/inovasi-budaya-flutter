// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:inovasi_budaya/dbHelper.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:inovasi_budaya/view/homepage/tataNilaiAkhlak.dart';
import 'package:inovasi_budaya/view/homepage/visiMisi.dart';
import 'package:inovasi_budaya/view/homepage/budaya.dart';
import 'package:inovasi_budaya/view/homepage/sekilasInformasi.dart';
import 'package:inovasi_budaya/view/homepage/timInternalisasi.dart';
import 'package:inovasi_budaya/view/homepage/reward.dart';
import 'package:inovasi_budaya/view/homepage/feedbackUser.dart';
import 'package:inovasi_budaya/view/homepage/component/circleImageTitle.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:timezone/standalone.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "";

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
    tz.initializeTimeZones();

    final FlutterLocalNotificationsPlugin notif =
        FlutterLocalNotificationsPlugin();
    try {
      await http.get(Uri.parse("${url}api/budaya/year/now")).then(
        (response) async {
          if (response.statusCode == 200) {
            budaya = jsonDecode(response.body);
            setState(() {
              budaya;
            });
            for (var b in budaya) {
              DateTime date = DateFormat('yyyy-MM')
                  .parse(b['tanggal'])
                  .add(const Duration(hours: 8, minutes: 30));
              if (date.isAfter(DateTime.now())) {
                if (date.weekday == DateTime.saturday) {
                  date.add(const Duration(days: 2));
                } else if (date.weekday == DateTime.sunday) {
                  date.add(const Duration(days: 1));
                }
                notif.zonedSchedule(
                    int.parse(b['id']),
                    b['judul'],
                    b['deskripsi'],
                    TZDateTime.from(date, getLocation('Asia/Jakarta')),
                    const NotificationDetails(
                        android: AndroidNotificationDetails(
                            'budaya', 'Notifikasi Budaya',
                            importance: Importance.max,
                            color: Colors.blue,
                            playSound: true,
                            icon: '@mipmap/ic_launcher')),
                    uiLocalNotificationDateInterpretation:
                        UILocalNotificationDateInterpretation.absoluteTime,
                    androidScheduleMode:
                        AndroidScheduleMode.exactAllowWhileIdle);
                if (kDebugMode) {
                  print("Added Notification for ${date.toString()}");
                }
              }
              await DatabaseHelper.instance.saveBudaya(int.parse(b['id']),
                  b['judul'], b['deskripsi'], b['tanggal'], b['updated_at']);
            }
          } else {
            throw Exception("Error connectiong to server");
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      DatabaseHelper.instance.getAllbudayaThisYear().then((value) {
        if (kDebugMode) {
          print(value);
        }
        budaya = value;
        setState(() {
          budaya;
        });
      });
    }
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
          } else {
            if (kDebugMode) {
              print(response.statusCode);
            }
            throw Exception("Error connectiong to server");
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      await DatabaseHelper.instance.getBudayaNow().then((value) {
        if (kDebugMode) {
          print(value);
        }
        setState(() {
          budayaNow = value;
        });
      });
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

  void incrementVisit() async {
    dynamic uid = await DatabaseHelper.instance.getUid();
    try {
      await http.get(Uri.parse("${url}api/visit/$uid/increment")).then(
        (response) {
          if (response.statusCode == 200) {
            if (kDebugMode) {
              print(jsonDecode(response.body)['msg']);
            }
          } else {
            throw (response.body);
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print(uid);
      }
    }
  }

  @override
  void initState() {
    getBudayaNow();
    getBudaya();
    getTimInternal();
    getReward();
    incrementVisit();
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
