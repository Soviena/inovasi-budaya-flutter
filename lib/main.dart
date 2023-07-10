import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/register.dart';
import 'package:inovasi_budaya/view/splash_view.dart';
import 'package:inovasi_budaya/view/HomePage.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splashView',
        routes: {
          '/splashView': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/register': (context) => Register()
        },
      ),
    );
