import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:inovasi_budaya/view/homepage/component/imageContainer.dart';

class Aktivitas extends StatefulWidget {
  const Aktivitas({super.key});

  @override
  _AktivitasState createState() => _AktivitasState();
}

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

class _AktivitasState extends State<Aktivitas> {
  Future<void> viewImage(BuildContext context, String image) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: const Color.fromARGB(255, 6, 51, 83),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          title: Container(
            alignment: Alignment.center,
            child: const Text(
              "<< Zoom >>",
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: InteractiveViewer(
            maxScale: 10,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset(image),
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
              viewImage(context, arr[index]);
            },
            child: ImageContainer(
                image: arr[index], deskripsi: "Deskripsi poster"),
          );
        },
      ),
    );
  }
}
