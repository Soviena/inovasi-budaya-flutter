// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:accordion/accordion.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// import 'package:quickalert/quickalert.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  final _headerStyle = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 24,
      fontWeight: FontWeight.bold);

  final _contentStyle = const TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900);

  List<AccordionSection> list = [];

  Future<dynamic> getData() async {
    var response = await http
        .get(Uri.parse("https://django.belajarpro.online/api/budaya/all"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  void makeAccordion() async {
    dynamic data = await getData();
    for (var budaya in data) {
      list.add(AccordionSection(
        headerBackgroundColor: const Color.fromARGB(100, 136, 136, 136),
        headerBackgroundColorOpened: const Color.fromARGB(255, 250, 131, 15),
        header: Text(
            DateFormat.yMMMM()
                .format(DateTime.parse(budaya['tanggal'] + "-01")),
            style: _headerStyle),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.topLeft,
              child: Text(
                budaya['judul'],
                style: _contentStyle,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                budaya['deskripsi'],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/aktivitas?id=${budaya['id']}");
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(252, 178, 106, 1))),
                child: const Text(
                  'Aktivitas',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        contentHorizontalPadding: 10,
        contentBorderWidth: 1,
        contentBackgroundColor: const Color.fromRGBO(252, 178, 106, 0.21),
        contentBorderColor: const Color.fromRGBO(252, 178, 106, 0.21),
        // onOpenSection: () => print('onOpenSection ...'),
        // onCloseSection: () => print('onCloseSection ...'),
      ));
    }
    setState(() {
      list;
    });
    return;
  }

  @override
  void initState() {
    makeAccordion();
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
          'Jadwal Budaya',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      drawer: const BurgerList(),
      body: Accordion(
          scaleWhenAnimating: false,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
          children: list),
    );
  }
}
