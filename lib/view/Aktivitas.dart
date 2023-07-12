import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Burger_Menu.dart';

class Budaya extends StatelessWidget {
  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  final _loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 6, 51, 83),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.orange,
              ),
              iconSize: 36,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BurgerList()),
                );
              },
            ),
            Text(
              'Jadwal',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(width: 48),
          ],
        ),
      ),
      body: Accordion(
          maxOpenSections: 2,
          headerBackgroundColorOpened: Colors.black54,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          children: [
            AccordionSection(
              isOpen: true,
              leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
              headerBackgroundColor: Colors.black,
              headerBackgroundColorOpened: Colors.red,
              header: Text('Introduction', style: _headerStyle),
              content: Text(_loremIpsum, style: _contentStyle),
              contentHorizontalPadding: 20,
              contentBorderWidth: 1,
              // onOpenSection: () => print('onOpenSection ...'),
              // onCloseSection: () => print('onCloseSection ...'),
            ),
          ]),
    );
  }
}
