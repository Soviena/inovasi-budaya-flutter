// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:inovasi_budaya/view/homepage/component/fileContainer.dart';
import 'package:http/http.dart' as http;

class Materi extends StatefulWidget {
  const Materi({super.key});

  @override
  State<Materi> createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  dynamic materi = [];
  String url = "https://admin.sucofindobandung.com/";

  void getData() async {
    await http.get(Uri.parse("${url}api/materi")).then(
      (response) {
        if (response.statusCode == 200) {
          materi = jsonDecode(response.body);
          setState(() {
            materi;
          });
        }
      },
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Builder(
          builder: (context) {
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
          },
        ),
        backgroundColor: const Color.fromARGB(255, 6, 51, 83),
        title: const Text(
          'Daftar Materi',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      drawer: const BurgerList(),
      body: ListView.builder(
        itemCount: materi.length, // Ganti dengan jumlah item yang sesuai
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              FileContainer(
                titleText: materi[index]['title'],
                fileUrl:
                    "${url}storage/uploaded/materi/${materi[index]['fileName']}",
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
      ),
    );
  }
}
