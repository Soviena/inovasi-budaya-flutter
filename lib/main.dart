import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/register.dart';
import 'package:inovasi_budaya/view/splash_view.dart';
import 'package:inovasi_budaya/view/HomePage.dart';

import 'package:inovasi_budaya/local_notification_helper.dart';
import 'package:workmanager/workmanager.dart';

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

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    // initialise the plugin of flutterlocalnotifications.
    final FlutterLocalNotificationsPlugin notif =
        FlutterLocalNotificationsPlugin();

    notif.show(
        0,
        "Testing ",
        "This is an Flutter Push Notification",
        const NotificationDetails(
          android: AndroidNotificationDetails(
              "high_importance_channel", "High Importance Notifications",
              channelDescription:
                  "This channel is used for important notifications.",
              importance: Importance.high,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher'),
        ));
    return Future.value(true);
  });
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
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(

      // The top level function, aka callbackDispatcher
      callbackDispatcher,

      // If enabled it will post a notification whenever
      // the task is running. Handy for debugging tasks
      isInDebugMode: true);
  // Periodic task registration
  Workmanager().registerPeriodicTask(
    "2",

    //This is the value that will be
    // returned in the callbackDispatcher
    "simplePeriodicTask",

    frequency: Duration(minutes: 15),
  );
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
