import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';

import 'homepage/component/imageContainer.dart';

class Safety_Moment extends StatefulWidget {
  const Safety_Moment({super.key});

  @override
  State<Safety_Moment> createState() => _Safety_MomentState();
}

class _Safety_MomentState extends State<Safety_Moment> {
  List<String> arr = [
    "assets/image/Poster1.png",
    "assets/image/Poster2.png",
    "assets/image/Poster3.png",
  ];
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
              "Zoom",
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
          'Safety Moments',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      drawer: const BurgerList(),
      body: MasonryGridView.count(
        padding: const EdgeInsets.all(10),
        itemCount: arr.length,
        crossAxisCount: 2,
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
