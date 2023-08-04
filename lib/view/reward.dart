import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:http/http.dart' as http;
import 'package:inovasi_budaya/view/homepage/component/circleImageTitle.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  List<AccordionSection> periode = [];
  String url = "http://192.168.1.128:8000/";

  void _showRewardDetailModal(String rewardsName, String deskripsi) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 26, 73, 128),
          title: Text(
            rewardsName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            deskripsi,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  void getData() async {
    dynamic json;
    await http.get(Uri.parse("${url}api/reward")).then(
      (response) {
        if (response.statusCode == 200) {
          json = jsonDecode(response.body);
          for (var p in json) {
            List<Widget> users = [];
            for (var user in p['users']) {
              users.add(Column(
                children: [
                  Avatar(
                    image: "${url}storage/uploaded/user/${user['profilepic']}",
                    titleText: user['name'],
                    network: true,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showRewardDetailModal(user['pivot']['rewardsName'],
                          user['pivot']['deskripsi']);
                    },
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 26, 73, 128),
                        borderRadius: BorderRadius.circular(12.5),
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                user['pivot']['rewardsName'],
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              user['pivot']['deskripsi'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
            }
            periode.add(AccordionSection(
              isOpen: false,
              headerBackgroundColor: const Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened:
                  const Color.fromARGB(255, 250, 131, 15),
              header: Text(p['periode'], style: _headerStyle),
              content: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: users,
                ),
              ),
            ));
          }
          setState(() {
            periode;
          });
        }
      },
    );
  }

  final _headerStyle = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 24,
      fontWeight: FontWeight.bold);

  @override
  void initState() {
    getData();
    super.initState();
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
          'Reward',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      drawer: const BurgerList(),
      body: Accordion(
          headerBackgroundColorOpened: Colors.black54,
          scaleWhenAnimating: false,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
          children: periode),
    );
  }
}
