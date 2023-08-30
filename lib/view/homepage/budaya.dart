// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/homepage/component/divider.dart';
import 'package:intl/intl.dart';

class InformasiBudaya extends StatefulWidget {
  InformasiBudaya({super.key, required this.budaya, required this.budayaNow});
  dynamic budaya;
  dynamic budayaNow;

  @override
  State<InformasiBudaya> createState() => _InformasiBudayaState();
}

class _InformasiBudayaState extends State<InformasiBudaya> {
  String url = "https://admin.sucofindobandung.com/";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextDivider(
            titleText: DateFormat.MMMM()
                .format(DateTime.parse(widget.budayaNow['tanggal'] + "-01"))),
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
                Text(
                  widget.budayaNow['judul'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 12.0)),
                Text(
                  widget.budayaNow['deskripsi'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const TextDivider(titleText: 'Jadwal Program Budaya'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(widget.budaya.length, (index) {
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
                      child: Center(
                        child: Text(
                          DateFormat.MMMM().format(DateTime.parse(
                              widget.budaya[index]['tanggal'] + "-01")),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              widget.budaya[index]['judul'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            child: Text(
                              widget.budaya[index]['deskripsi'],
                              softWrap: true,
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
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
