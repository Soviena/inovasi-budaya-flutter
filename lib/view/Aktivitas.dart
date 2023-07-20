import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:inovasi_budaya/view/homepage/component/imageContainer.dart';

class Aktivitas extends StatefulWidget {
  const Aktivitas({super.key});

  @override
  _AktivitasState createState() => _AktivitasState();
}

class _AktivitasState extends State<Aktivitas> {
  List<String> arr = [
    'assets/image/Siapkeakhlak.jpg',
    'assets/image/Posterlandscape1.jpg',
    'assets/image/PosterAkhlak.jpg',
    'assets/image/Posterlandscape1.jpg',
    'assets/image/Posterlandscape1.jpg',
    'assets/image/PosterAkhlak.jpg',
    'assets/image/PosterPerilakuAkhlak.jpg',
    'assets/image/PosterAkhlak.jpg',
    'assets/image/PosterAkhlak.jpg',
    'assets/image/Posterlandscape2.jpg'
  ];
  List<String> desc = [
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam',
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam',
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam',
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam',
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam',
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam',
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam',
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam',
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam',
    'lorem ipsum dolor ipsum some sum sum la med medika ark en siel lam nam kam'
  ];
  Future<void> viewImage(
      BuildContext context, String image, String deskripsi) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 3, 23, 38),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 6, 51, 83),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            alignment: Alignment.center,
            child: const Text(
              "<< Zoom >>",
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                InteractiveViewer(
                  maxScale: 10,
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.6),
                    child: Image.asset(image),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 6, 51, 83),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Text(
                      deskripsi,
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

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
          'Aktivitas',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      body: MasonryGridView.count(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              viewImage(context, arr[index], desc[index]);
            },
            child: ImageContainer(
                image: arr[index], deskripsi: "Deskripsi poster"),
          );
        },
      ),
    );
  }
}
