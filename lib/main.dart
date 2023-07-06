import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/login.dart';
import 'package:inovasi_budaya/view/SplashView.dart';
import 'package:inovasi_budaya/view/HomePage.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/HomePage',
        routes: {
          '/HomePage': (context) => HomePage(),
        },
      ),
    );
