import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';

class Kinerja extends StatelessWidget {
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
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Image.asset(
                    'assets/image/Gambar_Kinerja_Kecil.png', // Path dan nama file gambar Anda
                    width: 40,
                    height: 40,
                  ),
                  title: Row(
                    children: <Widget>[
                      Text('File Materi'),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.download),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, "/kinerja_Clicked");
                  },
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
