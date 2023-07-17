import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';

class Safety_Moment extends StatelessWidget {
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
            'Safety Moments',
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
                  margin: EdgeInsets.all(30),
                  alignment: Alignment.center,
                  height: 450,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage('assets/image/Poster1.png'),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 480, 30, 30),
                  alignment: Alignment.center,
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: const Column(
                    children: [
                      Text(
                        'Deskripsi',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        'Foto ini adalah sebuah foto yang diabadikan sebagai foto oleh fotografer',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )
                    ],
                  ),
                )
              ]),
              Stack(children: [
                Container(
                  margin: EdgeInsets.all(30),
                  alignment: Alignment.center,
                  height: 450,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage('assets/image/Poster2.png'),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 480, 30, 30),
                  alignment: Alignment.center,
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: const Column(
                    children: [
                      Text(
                        'Deskripsi',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        'Foto ini adalah sebuah foto yang diabadikan sebagai foto oleh fotografer',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )
                    ],
                  ),
                )
              ]),
              Stack(children: [
                Container(
                  margin: EdgeInsets.all(30),
                  alignment: Alignment.center,
                  height: 450,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage('assets/image/Poster3.png'),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 480, 30, 30),
                  alignment: Alignment.center,
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: const Column(
                    children: [
                      Text(
                        'Deskripsi',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        'Foto ini adalah sebuah foto yang diabadikan sebagai foto oleh fotografer',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )
                    ],
                  ),
                )
              ]),
            ],
          )),
        ));
  }
}
