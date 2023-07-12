import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Aktivitas.dart';
import 'package:inovasi_budaya/view/HomePage.dart';
import 'package:inovasi_budaya/view/Kinerja.dart';
import 'package:inovasi_budaya/view/Materi.dart';
import 'package:inovasi_budaya/view/Profil.dart';
import 'package:inovasi_budaya/view/SafetyMoment.dart';
import 'package:inovasi_budaya/view/Settings.dart';
import 'package:inovasi_budaya/view/splash_view.dart';

class BurgerList extends StatefulWidget {
  const BurgerList({Key? key}) : super(key: key);

  @override
  State<BurgerList> createState() => _BurgerListState();
}

class _BurgerListState extends State<BurgerList> {
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Color.fromARGB(255, 6, 51, 83),
      child: SingleChildScrollView(
        // Tambahkan SingleChildScrollView
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Container(
                      width: 5,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.orange,
                                size: 40,
                              ),
                            ),
                            Text(
                              "Menu",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 32),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 190, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white)),
                  ),
                  child: const Text(
                    "Home",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Budaya()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 70, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white)),
                  ),
                  child: const Text(
                    "Jadwal Budaya",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Materi_Share()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 190, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white)),
                  ),
                  child: const Text(
                    "Materi",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Kinerja()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 190, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white)),
                  ),
                  child: const Text(
                    "Kinerja",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Safety_Moment()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 80, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white)),
                  ),
                  child: const Text(
                    "Safety Moment",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 215, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white)),
                  ),
                  child: const Text(
                    "Profil",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 135, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white)),
                  ),
                  child: const Text(
                    "Pengaturan",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 185, 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white)),
                  ),
                  child: const Text(
                    "Log Out",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
