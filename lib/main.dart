import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/register.dart';
import 'package:inovasi_budaya/view/splash_view.dart';
import 'package:inovasi_budaya/view/HomePage.dart';

String? token;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

getToken() async {
  token = await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.instance.subscribeToTopic('budaya');
  print("Token : " + token.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  getToken();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashView',
      routes: {
        '/splashView': (context) => const LoginPage(),
        '/home': (context) => HomePage(),
        '/register': (context) => const Register()
      },
    ),
  );
}
