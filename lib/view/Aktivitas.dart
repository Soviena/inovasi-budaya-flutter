// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:inovasi_budaya/view/homepage/component/imageContainer.dart';
import 'package:http/http.dart' as http;

class Aktivitas extends StatefulWidget {
  const Aktivitas({super.key, required this.idBudaya});
  final int idBudaya;

  @override
  // ignore: library_private_types_in_public_api
  _AktivitasState createState() => _AktivitasState();
}

class _AktivitasState extends State<Aktivitas> {
  String url = "https://django.belajarpro.online/";
  // ignore: non_constant_identifier_names
  dynamic Budaya = {
    "id": 0,
    "judul": "0",
    "deskripsi": "0",
    "tanggal": "2023-07",
    "created_at": "2023-07-18T01:07:41.000000Z",
    "updated_at": "2023-07-18T01:07:41.000000Z",
    "aktivitas": [
      {
        "id": 0,
        "budaya_id": 0,
        "judul": "loading",
        "deskripsi": "loading",
        "fileName": "loading",
        "created_at": "2023-07-24T01:35:03.000000Z",
        "updated_at": "2023-07-24T01:35:03.000000Z"
      }
    ]
  };
  void getData() async {
    await http.get(Uri.parse("${url}api/aktivitas/${widget.idBudaya}")).then(
      (response) {
        if (response.statusCode == 200) {
          Budaya = jsonDecode(response.body);
        }
        setState(() {
          Budaya;
        });
      },
    );
  }

  Future<void> viewImage(
      BuildContext context, String image, String deskripsi) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 3, 23, 38),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 6, 51, 83),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            alignment: Alignment.center,
            child: const Text(
              "<< Zoom >>",
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                InteractiveViewer(
                  maxScale: 10,
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.6),
                    child: Image.network(image),
                    // child: NetworkImage(image),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 6, 51, 83),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Text(
                      deskripsi,
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
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
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.orange,
            ),
            iconSize: 36,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }),
        backgroundColor: const Color.fromARGB(255, 6, 51, 83),
        title: const Text(
          'Aktivitas',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      body: MasonryGridView.count(
        padding: const EdgeInsets.all(10),
        itemCount: Budaya['aktivitas'].length,
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              viewImage(
                  context,
                  "${url}storage/uploaded/aktivitas/${Budaya['aktivitas'][index]["fileName"]}",
                  Budaya['aktivitas'][index]['deskripsi'] ?? "");
            },
            child: ImageContainer(
              image:
                  "${url}storage/uploaded/aktivitas/${Budaya['aktivitas'][index]["fileName"]}",
              deskripsi: Budaya['aktivitas'][index]['judul'] ?? "",
              network: true,
            ),
          );
        },
      ),
    );
  }
}
