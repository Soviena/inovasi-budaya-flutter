import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:inovasi_budaya/view/homepage/component/fileContainer.dart';

class Kinerja extends StatelessWidget {
  const Kinerja({super.key});

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
            'Kinerja',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        drawer: const BurgerList(),
        body: ListView.builder(
          itemCount: 4, // Ganti dengan jumlah item yang sesuai
          itemBuilder: (BuildContext context, int index) {
            return const Column(
              children: <Widget>[
                FileContainer(
                  titleText: 'Kinerja',
                  fileUrl: "testUrl",
                  iconImage: "assets/image/Gambar_Kinerja_Kecil.png",
                  route: "/kinerja_Clicked",
                ),
                Divider(
                  color: Colors.black,
                  height: 20,
                ),
              ],
            );
          },
        ));
  }
}
