import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Aktivitas.dart';
import 'package:inovasi_budaya/view/HomePage.dart';

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
      child: Container(
        child: Column(
          children: [
            Container(
              //tombol back
              height: 56,
              alignment: Alignment.topLeft,
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Menu", style: TextStyle(color: Colors.orange))
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 240),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.orange,
                      size: 40,
                    ),
                  ),
                ),
              ],
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
                    border: Border(bottom: BorderSide(color: Colors.white))),
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
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Jadwal Budaya",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 190, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Materi",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 190, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Kinerja",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 80, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Safety Moment",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 200, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Profile",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 135, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Pengaturan",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 185, 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))),
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}