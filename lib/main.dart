import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/dbHelper.dart';
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
import 'package:permission_handler/permission_handler.dart';

import 'package:workmanager/workmanager.dart';

import 'firebase_options.dart';

String? token;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    print('Handling a background message ${message.messageId}');
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'notifikasi_pengingat',
  'Notifikasi pengingat peregangan dan 5S',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

const AndroidNotificationChannel budayaChannel = AndroidNotificationChannel(
  'budaya',
  'Notifikasi mengenai budaya',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

const AndroidNotificationDetails notificationDetailsPengingat =
    AndroidNotificationDetails(
        'notifikasi_pengingat', 'Notifikasi pengingat peregangan dan 5S',
        importance: Importance.high,
        color: Colors.blue,
        playSound: true,
        icon: '@mipmap/ic_launcher');

getToken() async {
  token = await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.instance.subscribeToTopic('budaya');
  if (kDebugMode) {
    print("Token : $token");
  }
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
                android: AndroidNotificationDetails("notifikasi_pengingat",
                    "Notifikasi pengingat peregangan dan 5S",
                    channelDescription:
                        "This channel is used for important notifications.",
                    importance: Importance.high,
                    color: Colors.blue,
                    playSound: true,
                    icon: '@mipmap/ic_launcher'),
              ));
        }
        break;
      case "firstjumatbersih":
        notif.show(1, "Jumat Bersih 5S", "Jumat Bersih 5S",
            const NotificationDetails(android: notificationDetailsPengingat));
        Workmanager().registerPeriodicTask('jumatBersih', 'jumatbersih',
            frequency: const Duration(days: 7));
        break;
      case "firstperegangan10":
        notif.show(
            2,
            "Peregangan",
            "Jangan Lupa Peregangan agar badan tetap sehat :)",
            const NotificationDetails(android: notificationDetailsPengingat));
        Workmanager().registerPeriodicTask('stretching10', 'peregangan',
            frequency: const Duration(days: 1));
        break;
      case "firstperegangan15":
        notif.show(
            3,
            "Peregangan",
            "Jangan Lupa Peregangan agar badan tetap sehat :)",
            const NotificationDetails(android: notificationDetailsPengingat));
        Workmanager().registerPeriodicTask('stretching15', 'peregangan',
            frequency: const Duration(days: 1));
        break;
      case "jumatbersih":
        notif.show(1, "Jumat Bersih 5S", "Jumat Bersih 5S",
            const NotificationDetails(android: notificationDetailsPengingat));
        break;
      case "peregangan":
        if (DateTime.now().weekday == (DateTime.saturday) ||
            DateTime.now().weekday == (DateTime.sunday)) {
          break;
        }
        notif.show(
            2,
            "Peregangan",
            "Jangan Lupa Peregangan agar badan tetap sehat :)",
            const NotificationDetails(android: notificationDetailsPengingat));
        break;
    }

    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(budayaChannel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  if (!kIsWeb) {
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
  }
  getToken();
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(

      // The top level function, aka callbackDispatcher
      callbackDispatcher,

      // If enabled it will post a notification whenever
      // the task is running. Handy for debugging tasks
      isInDebugMode: false);
  // Periodic task registration
  DateTime now = DateTime.now();
  Duration initialDelay;
  bool boolNotif = await DatabaseHelper.instance.getNotificationExist(1);
  if (!boolNotif) {
    DateTime nextFriday = now.add(Duration(days: (5 - now.weekday + 7) % 7));
    DateTime nextFridayAt815 =
        DateTime(nextFriday.year, nextFriday.month, nextFriday.day, 8, 15);
    initialDelay = nextFridayAt815.difference(now);
    Workmanager().registerOneOffTask('firstFriday', 'firstjumatbersih',
        initialDelay: initialDelay);
    await DatabaseHelper.instance
        .addNotification(1, "jumatbersih", "setiap jumat jam 8 15");
    if (kDebugMode) {
      print("Added new notif for juamtbersih");
    }
  }
  boolNotif = await DatabaseHelper.instance.getNotificationExist(2);
  if (!boolNotif) {
    if (now.hour < 10 &&
        (now.weekday != DateTime.saturday ||
            now.weekday != DateTime.saturday)) {
      DateTime next10 = DateTime(now.year, now.month, now.day, 10, 0);
      initialDelay = next10.difference(now);
    } else if (now.weekday == DateTime.friday) {
      DateTime next10 = DateTime(now.year, now.month, now.day + 3, 10, 0);
      initialDelay = next10.difference(now);
    } else if (now.weekday == DateTime.saturday) {
      DateTime next10 = DateTime(now.year, now.month, now.day + 2, 10, 0);
      initialDelay = next10.difference(now);
    } else {
      DateTime next10 = DateTime(now.year, now.month, now.day + 2, 10, 0);
      initialDelay = next10.difference(now);
    }
    Workmanager().registerOneOffTask('stretching', 'firstperegangan10',
        initialDelay: initialDelay);
    await DatabaseHelper.instance
        .addNotification(2, "peregangan10", "peregangan harian jam 10");
    if (kDebugMode) {
      print("Added new notif for peregangan 10");
    }
  }
  boolNotif = await DatabaseHelper.instance.getNotificationExist(3);
  if (!boolNotif) {
    if (now.hour < 10) {
      DateTime next10 = DateTime(now.year, now.month, now.day, 15, 0);
      initialDelay = next10.difference(now);
    } else {
      DateTime next10 = DateTime(now.year, now.month, now.day + 1, 15, 0);
      initialDelay = next10.difference(now);
    }
    Workmanager().registerOneOffTask('stretching', 'firstperegangan15',
        initialDelay: initialDelay);
    await DatabaseHelper.instance
        .addNotification(3, "peregangan15", "peregangan harian jam 15");
    if (kDebugMode) {
      print("Added new notif for peregangan 15");
    }
  }
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
