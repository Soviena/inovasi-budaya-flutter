import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/SplashView.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/SplashView',
        routes: {
          '/SplashView': (context) => LoginPage(),
        },
      ),
    );
