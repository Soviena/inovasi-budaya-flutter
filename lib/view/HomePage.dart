import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Aktivitas.dart';
import 'package:inovasi_budaya/view/Burger_Menu.dart';

class HomePage extends StatelessWidget {
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
                'Homepage',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Padding(padding: EdgeInsets.all(20))
            ],
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sucofindo',
                      style: TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 26, 73, 128),
                      ),
                    ),
                    Text(
                      'Ber-AKHLAK',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 2, 124, 204),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(16.0)),
                    Image.asset(
                      'assets/image/Akhlak.png',
                      fit: BoxFit.cover,
                    ),
                    Padding(padding: EdgeInsets.all(16.0)),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 2, 33, 204),
                            const Color.fromARGB(255, 95, 220, 216)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi yang akan dilakukan saat tombol ditekan
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(0, 0, 0, 0),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Tata Nilai Akhlak',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 1920,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/Visi_Misi_Image.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
