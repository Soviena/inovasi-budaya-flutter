import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/login.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginView(),
        },
      ),
    );
