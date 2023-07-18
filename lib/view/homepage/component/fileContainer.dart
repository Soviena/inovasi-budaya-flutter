import 'package:flutter/material.dart';

class FileContainer extends StatelessWidget {
  const FileContainer(
      {super.key,
      required this.titleText,
      required this.fileUrl,
      required this.iconImage,
      required this.route});
  final String titleText;
  final String fileUrl;
  final String iconImage;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        iconImage, // Path dan nama file gambar Anda
        width: 40,
        height: 40,
      ),
      title: Row(
        children: <Widget>[
          Text(titleText),
          const Spacer(),
          GestureDetector(
            onTap: () {
              print(fileUrl);
            },
            child: const Icon(Icons.download),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
