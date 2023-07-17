import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/homepage/component/divider.dart';

class InformasiBudaya extends StatelessWidget {
  const InformasiBudaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextDivider(titleText: 'NamaBulan'),
        Container(
          width: 320,
          height: 240,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 73, 128),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(2, 2),
              ),
            ],
            border: Border.all(
              color: Colors.orange,
              width: 3,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kegiatan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 12.0)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.only(top: 8, right: 8),
                    ),
                    const Text(
                      'Lorem ipsum',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const TextDivider(titleText: 'Jadwal Program Budaya'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(5, (index) {
              return Container(
                padding: const EdgeInsets.only(top: 24.0),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: 250,
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(2, 1),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: const Center(
                        child: Text(
                          'Januari',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'lorem ipsum',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
