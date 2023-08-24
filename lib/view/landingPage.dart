import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/dbHelper.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool loggedIn = false;

  Future<void> getDb() async {
    bool db = await DatabaseHelper.instance.getLogin();
    loggedIn = db;
  }

  @override
  void initState() {
    super.initState();
    getDb();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      if (loggedIn) {
        Navigator.popAndPushNamed(context, "/home");
      } else {
        Navigator.popAndPushNamed(context, "/splashView");
      }
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/LandingPagebg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/image/LogoE-Culture.png',
                  width: 280,
                  height: 250,
                ),
              ),
              const Text(
                'Aplikasi Pegawai Sucofindo',
                style: TextStyle(
                  color: Color.fromARGB(255, 45, 75, 155),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
