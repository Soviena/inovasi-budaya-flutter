import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:workmanager/workmanager.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController jam = TextEditingController();
  final items = ['Tiap hari 1x', 'Interval', 'off'];
  String? placeholderTime = "Tekan untuk ubah";
  String? value;
  String? type;
  TimeOfDay? tod;

  setTime(value) {
    setState(() {
      tod = value;
      placeholderTime = "${tod?.hour}:${tod?.minute}";
    });
  }

  bool isTimeOfDayPassed(DateTime futureDateTime) {
    final now = DateTime.now();
    final currentTime = TimeOfDay(hour: now.hour, minute: now.minute);
    final currentDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      currentTime.hour,
      currentTime.minute,
    );

    return futureDateTime.isBefore(currentDateTime);
  }

  Widget option(BuildContext context) {
    if (value == 'Tiap hari 1x') {
      type = "1time";
      return Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Pada jam ?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: 120,
              // padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () async {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) => {setTime(value)});
                  type = "1time";
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 6, 51, 83),
                  ),
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      placeholderTime.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (value == "Interval") {
      type = "interval";
      return Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tiap berapa jam ?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: 120,
              // padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 6, 51, 83),
                ),
                child: TextField(
                  controller: jam,
                  onChanged: (data) {
                    type = "interval";
                  },
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      type = "off";
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.orange,
            ),
            iconSize: 36,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        backgroundColor: const Color.fromARGB(255, 6, 51, 83),
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      drawer: const BurgerList(),
      backgroundColor: const Color.fromARGB(255, 6, 51, 83),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Notifikasi Peregangan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: 120,
                          // padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: value,
                              iconSize: 36,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.orange,
                              ),
                              dropdownColor:
                                  const Color.fromARGB(255, 6, 51, 83),
                              items: items.map(buildMenuItem).toList(),
                              onChanged: (value) =>
                                  setState(() => this.value = value),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  option(context),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60, right: 30),
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                if (type == "1time") {
                  final currentTime = TimeOfDay.now();
                  final futureTime = tod!;
                  final currentDateTime = DateTime.now();
                  final futureDateTime = DateTime(
                    currentDateTime.year,
                    currentDateTime.month,
                    currentDateTime.day,
                    futureTime.hour,
                    futureTime.minute,
                  );
                  if (isTimeOfDayPassed(futureDateTime)) {
                    futureDateTime.add(Duration(days: 1));
                  }
                  final duration = futureDateTime.difference(currentDateTime);
                  final remainingDuration = Duration(
                      hours: duration.inHours,
                      minutes: duration.inMinutes % 60);

                  print('Current Time: $currentTime');
                  print('Future Time: $futureTime');
                  print('Remaining Duration: $remainingDuration');
                  Workmanager().cancelByUniqueName("peregangan");
                  Workmanager().registerPeriodicTask(
                      "peregangan", "pengingatPeregangan",
                      frequency: Duration(days: 1),
                      initialDelay: remainingDuration);
                } else if (type == "interval") {
                  print("interval");
                  Workmanager().cancelByUniqueName("peregangan");
                  Workmanager().registerPeriodicTask(
                      "peregangan", "pengingatPeregangan",
                      frequency: Duration(hours: int.parse(jam.text)));
                } else {
                  print("off");
                  Workmanager().cancelByUniqueName("peregangan");
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.orange,
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(150, 50),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 6, 51, 83),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(color: Colors.white),
        ),
      );
}
