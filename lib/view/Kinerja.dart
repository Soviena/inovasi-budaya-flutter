import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:inovasi_budaya/view/homepage/component/fileContainer.dart';
import 'package:http/http.dart' as http;

class Kinerja extends StatefulWidget {
  const Kinerja({super.key});

  @override
  State<Kinerja> createState() => _KinerjaState();
}

class _KinerjaState extends State<Kinerja> {
  dynamic kinerja = [];

  String url = "http://192.168.1.128:8000/";

  void getData() async {
    await http.get(Uri.parse("${url}api/kinerja")).then(
      (response) {
        if (response.statusCode == 200) {
          kinerja = jsonDecode(response.body);
          setState(() {
            kinerja;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
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
            'Kinerja Bulanan',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        drawer: const BurgerList(),
        body: ListView.builder(
          itemCount: kinerja.length, // Ganti dengan jumlah item yang sesuai
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                FileContainer(
                  titleText: kinerja[index]['tanggal'],
                  fileUrl: "${url}kinerja/view/${kinerja[index]['id']}",
                  iconImage: "assets/image/Gambar_Kinerja_Kecil.png",
                  route: "",
                ),
                const Divider(
                  color: Colors.black,
                  height: 20,
                ),
              ],
            );
          },
        ));
  }
}
