import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Aktivitas.dart';
import 'package:inovasi_budaya/view/kinerjaClicked.dart';
import 'package:inovasi_budaya/view/register.dart';
import 'package:inovasi_budaya/view/reward.dart';
import 'package:inovasi_budaya/view/splash_view.dart';
import 'package:inovasi_budaya/view/homePage.dart';
import 'package:inovasi_budaya/view/Jadwal.dart';
import 'package:inovasi_budaya/view/Kinerja.dart';
import 'package:inovasi_budaya/view/Materi.dart';
import 'package:inovasi_budaya/view/Profil.dart';
import 'package:inovasi_budaya/view/SafetyMoment.dart';
import 'package:inovasi_budaya/view/Settings.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:workmanager/workmanager.dart';

import 'firebase_options.dart';

String? token;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  print("Token : $token");
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    // initialise the plugin of flutterlocalnotifications.
    final FlutterLocalNotificationsPlugin notif =
        FlutterLocalNotificationsPlugin();
    switch (task) {
      case "pengingatPeregangan":
        if (TimeOfDay.now().hour >= 8 && TimeOfDay.now().hour <= 17) {
          notif.show(
              1,
              "Pengingat peregangan",
              "Jangan lupa meregangkan badan agar badan tetap sehat",
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
        }
    }

    return Future.value(true);
  });
}

void main() async {
  sqfliteFfiInit();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      initialRoute: '/splashView',
      onGenerateRoute: (settings) {
        final Uri uri = Uri.parse(settings.name!);
        if (uri.path == '/aktivitas') {
          final int id = int.parse(uri.queryParameters['id']!);
          return MaterialPageRoute(
            builder: (context) => Aktivitas(idBudaya: id),
            settings: settings,
          );
        }
        return null;
      },
      routes: {
        '/splashView': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const Register(),
        '/jadwal': (context) => const Jadwal(),
        '/kinerja': (context) => const Kinerja(),
        '/reward': (context) => const Reward(),
        '/materi': (context) => const Materi(),
        '/profil': (context) => const Profile(),
        '/safety': (context) => const Safety_Moment(),
        '/setting': (context) => const Settings(),
        '/kinerja_Clicked': (context) => const KinerjaClicked(),
      },
    ),
  );
}
