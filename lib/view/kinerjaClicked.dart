import 'package:flutter/material.dart';

class KinerjaClicked extends StatefulWidget {
  const KinerjaClicked({Key? key}) : super(key: key);

  @override
  State<KinerjaClicked> createState() => _KinerjaClickedState();
}

class _KinerjaClickedState extends State<KinerjaClicked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.orange,
            ),
            iconSize: 36,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }),
        backgroundColor: const Color.fromARGB(255, 6, 51, 83),
        title: const Text(
          'Kinerja Bulan ...',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InteractiveViewer(
          constrained: false,
          maxScale: 5.0,
          minScale: 0.1,
          boundaryMargin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.6),
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text("Uraian")),
              DataColumn(label: Text("Anggaran")),
              DataColumn(label: Text("Realisasi")),
              DataColumn(label: Text("%-Real thd ANG")),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text("Pendapatan Operasi")),
                  DataCell(Text("159")),
                  DataCell(Text("6.0")),
                  DataCell(Text("4.0")),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text("Biaya Operasi")),
                  DataCell(Text("237")),
                  DataCell(Text("9.0")),
                  DataCell(Text("4.3")),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text("thd Pendapatan operasi")),
                  DataCell(Text("262")),
                  DataCell(Text("16.0")),
                  DataCell(Text("6.0")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
