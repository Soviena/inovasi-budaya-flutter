import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Burger_Menu.dart';

class Aktivitas extends StatefulWidget {
  const Aktivitas({super.key});

  @override
  _AktivitasState createState() => _AktivitasState();
}

class _AktivitasState extends State<Aktivitas> {
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
          'Aktivitas',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      drawer: const BurgerList(),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              Stack(children: [
                Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 290,
                  width: 170,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/image/Posterlandscape1.jpg'))),
                ),
                Positioned(
                  left: 15,
                  bottom: 40,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 170,
                    height: 30,
                    color: const Color.fromARGB(150, 6, 51, 83),
                    child: Text(
                      ' Deskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi Foto',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 290,
                  width: 170,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/image/Siapkeakhlak.jpg'))),
                ),
                Positioned(
                  left: 15,
                  bottom: 40,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 170,
                    height: 30,
                    color: const Color.fromARGB(150, 6, 51, 83),
                    child: Text(
                      ' Deskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi Foto',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 290,
                  width: 170,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/image/Poster1.png'))),
                ),
                Positioned(
                  left: 15,
                  bottom: 40,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 170,
                    height: 30,
                    color: const Color.fromARGB(150, 6, 51, 83),
                    child: Text(
                      ' Deskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi Foto',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 290,
                  width: 170,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/image/PosterPerilakuAkhlak.jpg'))),
                ),
                Positioned(
                  left: 15,
                  bottom: 40,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 170,
                    height: 30,
                    color: const Color.fromARGB(150, 6, 51, 83),
                    child: Text(
                      ' Deskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi Foto',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 290,
                  width: 170,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/image/Posterlandscape2.jpg'))),
                ),
                Positioned(
                  left: 15,
                  bottom: 40,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 170,
                    height: 30,
                    color: const Color.fromARGB(150, 6, 51, 83),
                    child: Text(
                      ' Deskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi Foto',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  height: 290,
                  width: 170,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/image/PosterAkhlak.jpg'))),
                ),
                Positioned(
                  left: 15,
                  bottom: 40,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: 170,
                    height: 30,
                    color: const Color.fromARGB(150, 6, 51, 83),
                    child: Text(
                      ' Deskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi FotoDeskripsi Foto',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
