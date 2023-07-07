import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Burger_Menu.dart';
import 'package:inovasi_budaya/view/HomePage.dart';

class Budaya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 51, 83),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.orange,
                ),
                iconSize: 36,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BurgerList()),
                  );
                },
              ),
              Text(
                'Jadwal',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }
}
