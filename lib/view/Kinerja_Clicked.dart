import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Kinerja.dart';

class Kinerja_Clicked extends StatefulWidget {
  const Kinerja_Clicked({Key? key}) : super(key: key);

  @override
  State<Kinerja_Clicked> createState() => _Kinerja_ClickedState();
}

class _Kinerja_ClickedState extends State<Kinerja_Clicked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kinerja Usaha Cabang Bandung'),
      ),
      body: InteractiveViewer(
        maxScale: 5.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(label: Text("Uraian")),
              DataColumn(label: Text("Anggaran")),
              DataColumn(label: Text("Realisasi")),
              DataColumn(label: Text("%-Real thd ANG")),
            ],
            rows: <DataRow>[
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
