// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FileContainer extends StatefulWidget {
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
  State<FileContainer> createState() => _FileContainerState();
}

class _FileContainerState extends State<FileContainer> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        widget.iconImage, // Path dan nama file gambar Anda
        width: 40,
        height: 40,
      ),
      title: Row(
        children: <Widget>[
          Text(widget.titleText),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print(widget.fileUrl);
              }
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      onTap: () {
        launchUrl(Uri.parse(widget.fileUrl),
            mode: LaunchMode.externalApplication);
      },
    );
  }
}
