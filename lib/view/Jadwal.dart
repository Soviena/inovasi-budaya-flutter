import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:accordion/accordion.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  final _headerStyle = const TextStyle(
      color: Color.fromARGB(255, 136, 136, 136),
      fontSize: 24,
      fontWeight: FontWeight.bold);

  final _contentStyle = const TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900);

  final _loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

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
          'Jadwal Budaya',
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
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
          children: [
            AccordionSection(
              isOpen: false,

              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('Januari', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
              // onOpenSection: () => print('onOpenSection ...'),
              // onCloseSection: () => print('onCloseSection ...'),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('Februari', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('Maret', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('April', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('Mei', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('Juni', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('Juli', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('Agustus', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('September', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('Oktober', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('November', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
            AccordionSection(
              isOpen: false,
              headerBackgroundColor: Color.fromARGB(100, 136, 136, 136),
              headerBackgroundColorOpened: Color.fromARGB(255, 250, 131, 15),
              header: Text('Desember', style: _headerStyle),
              content: Column(
                children: [
                  Text(_loremIpsum, style: _contentStyle),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Aktivitas',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(252, 178, 106, 1))),
                    ),
                  ),
                ],
              ),
              contentHorizontalPadding: 10,
              contentBorderWidth: 1,
              contentBackgroundColor: Color.fromRGBO(252, 178, 106, 0.21),
              contentBorderColor: Color.fromRGBO(252, 178, 106, 0.21),
            ),
          ]),
    );
  }
}