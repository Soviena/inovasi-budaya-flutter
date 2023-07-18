import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  final _headerStyle = const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 24,
      fontWeight: FontWeight.bold);

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
          children: [
            AccordionSection(
              isOpen: false,

              headerBackgroundColor: const Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened:
                  const Color.fromARGB(255, 250, 131, 15),
              header: Text('Januari', style: _headerStyle),
              content: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.person_outline_rounded, size: 50),
                      Text(
                        'User1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'Reward',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.person_outline_rounded, size: 50),
                      Text(
                        'User2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'Reward',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.person_outline_rounded, size: 50),
                      Text(
                        'User3',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'Reward',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: const Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: const Color.fromRGBO(252, 178, 106, 0.21),
              // onOpenSection: () => print('onOpenSection ...'),
              // onCloseSection: () => print('onCloseSection ...'),
            ),
          ]),
    );
  }
}
