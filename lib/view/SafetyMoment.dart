import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body: ListView(
        padding: EdgeInsets.all(24.0),
        children: [
          Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  alignment: Alignment.center,
                  child: Text(
                    'Judul Flyer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Image.asset('assets/image/Poster1.png'),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                SizedBox(height: 35),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  alignment: Alignment.center,
                  child: Text(
                    'Judul Flyer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Image.asset('assets/image/Poster2.png'),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                SizedBox(height: 35),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  alignment: Alignment.center,
                  child: Text(
                    'Judul Flyer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Image.asset('assets/image/Poster3.png'),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 26, 73, 128),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
