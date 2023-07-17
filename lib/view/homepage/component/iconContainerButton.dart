import 'package:flutter/material.dart';

class IconContainerButton extends StatelessWidget {
  const IconContainerButton(
      {super.key,
      required this.titleText,
      required this.iconAsset,
      required this.isLeft});
  final String titleText;
  final String iconAsset;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    Radius radiusRight = const Radius.circular(24);
    Radius radiusLeft = const Radius.circular(96);
    AlignmentGeometry align = Alignment.topRight;
    EdgeInsetsGeometry margin = const EdgeInsets.only(right: 10, top: 20);
    if (isLeft) {
      radiusRight = const Radius.circular(96);
      radiusLeft = const Radius.circular(24);
      align = Alignment.topLeft;
      margin = const EdgeInsets.only(left: 10, top: 20);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 160,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: radiusLeft,
            topRight: radiusRight,
            bottomLeft: const Radius.circular(24),
            bottomRight: const Radius.circular(24)),
        border: Border.all(
          color: const Color.fromARGB(255, 2, 124, 204),
          width: 2,
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: align,
            margin: margin,
            child: Text(
              titleText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              iconAsset,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context, "/materi");
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 2, 124, 204),
                      Color.fromARGB(255, 95, 220, 216)
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Text(
                  'Selengkapnya',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
