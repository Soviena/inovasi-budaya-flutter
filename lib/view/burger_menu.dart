import 'package:flutter/material.dart';

class BurgerList extends StatefulWidget {
  const BurgerList({Key? key}) : super(key: key);

  @override
  State<BurgerList> createState() => _BurgerListState();
}

class _BurgerListState extends State<BurgerList> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: const Color.fromARGB(255, 6, 51, 83),
      child: SingleChildScrollView(
        // Tambahkan SingleChildScrollView
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.orange,
                              size: 40,
                            ),
                          ),
                          const Text(
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
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/home");
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/jadwal");
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              title: const Text(
                "Jadwal Budaya",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/materi");
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              title: const Text(
                "Materi",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/kinerja");
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              title: const Text(
                "Kinerja",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/reward");
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              title: const Text(
                "Reward",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/safety");
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              title: const Text(
                "Safety Moment",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/profil");
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              title: const Text(
                "Profile",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/setting");
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              title: const Text(
                "Pengaturan",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/splashView");
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              title: const Text(
                "Log Out",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
