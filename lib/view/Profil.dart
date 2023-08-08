// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/dbHelper.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;

import 'dart:io';

import 'package:quickalert/quickalert.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String url = "https://django.belajarpro.online/";
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final picker = ImagePicker();
  final cropper = ImageCropper();
  late String tanggalLahir;
  bool editState = false;

  dynamic user = {
    "id": 0,
    "email": "-",
    "dob": "0000-00-00",
    "name": "loading"
  };

  void getData() async {
    user = await DatabaseHelper.instance.getSession();
    setState(() {
      name.text = user['name'];
      email.text = user['email'];
      tanggalLahir = user['dob'];
      user;
      profilePic =
          NetworkImage("${url}storage/uploaded/user/${user['profilePic']}");
    });
  }

  void failedAlert(text) {
    Navigator.pop(context);

    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops',
      text: text,
    );
  }

  Future<CroppedFile?> _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await cropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(
          ratioX: 1, ratioY: 1), // You can adjust the aspect ratio as needed.
      compressQuality: 100, // Set the image quality after cropping (0 to 100).
      maxWidth: 800, // Set the maximum width of the cropped image.
      maxHeight: 800, // Set the maximum height of the cropped image.
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepPurple,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
        WebUiSettings(
            context: context,
            enableResize: false,
            enableZoom: true,
            mouseWheelZoom: true,
            boundary: CroppieBoundary(
                width: (MediaQuery.of(context).size.width * 0.7).ceil(),
                height: (MediaQuery.of(context).size.width * 0.7).ceil()),
            viewPort: CroppieViewPort(
                width: (MediaQuery.of(context).size.width * 0.7).ceil(),
                height: (MediaQuery.of(context).size.width * 0.7).ceil()))
      ],
    );

    return croppedFile;
  }

  Future<CroppedFile?> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      CroppedFile? croppedPicture = await _cropImage(File(pickedImage.path));
      // File picture = File(croppedPicture!.path);
      return croppedPicture;
    } else {
      return null;
    }
  }

  void editProfilepic() async {
    CroppedFile? pic = await _pickImage();
    if (pic != null) {
      if (kIsWeb) {
        final response =
            await html.HttpRequest.request(pic.path, responseType: 'blob');
        final blob = response.response;
        newProfilepic = html.File([blob], "newPic");
      } else {
        newProfilepic = File(pic.path);
      }
      setState(() {
        newProfilepic;
        profilePic =
            kIsWeb ? NetworkImage(pic.path) : FileImage(File(pic.path));
      });
    } else {
      return;
    }
  }

  void checkEmailVerified() async {
    dynamic data = await DatabaseHelper.instance.getSession();
    if (data['verified'] != "true") {
      emailNotice = Wrap(
        children: [
          Text(
            "Email Belum Terverifikasi, Tidak mendapatkan email ?",
            style: TextStyle(color: Colors.red.shade500),
          ),
          TextButton(
              onPressed: () async {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.loading,
                  title: 'Loading',
                  text: 'Mengupdate akun',
                );
                try {
                  await http
                      .get(Uri.parse(
                          "${url}api/email/verify/resend/${data['uid']}"))
                      .then(
                    (response) {
                      if (response.statusCode == 200) {
                        Navigator.pop(context);
                        // ignore: use_build_context_synchronously
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          title: 'Berhasil',
                          text:
                              'Link verifikasi email terbaru sudah dikirim :)',
                        );
                      } else if (response.statusCode == 400) {
                        failedAlert("Email sudah di verifikasi");
                      } else {
                        throw (response.body);
                      }
                    },
                  );
                } catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
              child: const Text("Kirim Ulang"))
        ],
      );
      setState(() {
        emailNotice;
      });
    }
  }

  Widget emailNotice = const Text("");

  dynamic profilePic = const NetworkImage(
      "https://django.belajarpro.online/storage/uploaded/user/default.png");
  dynamic newProfilepic;

  Widget profileContainer() {
    if (editState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              editProfilepic();
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black38,
                    image: DecorationImage(opacity: 100, image: profilePic)),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Nama',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.orange, width: 1),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: name,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.orange, width: 1),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: email,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Tanggal Lahir',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.parse("1950-01-01"),
                        lastDate: DateTime.now(),
                      ).then(
                        (date) => {
                          setState(() {
                            tanggalLahir =
                                "${date?.year}-${date?.month}-${date?.day}";
                          })
                        },
                      );
                    },
                    child: Container(
                      height: 30,
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.orange, width: 1),
                        color: Colors.white,
                      ),
                      child: Text(tanggalLahir),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.loading,
                      title: 'Loading',
                      text: 'Mengupdate akun',
                    );
                    if (email.text == "" ||
                        name.text == "" ||
                        tanggalLahir == "") {
                      failedAlert(
                          "Lengkapi dulu data diri yang mau di update ya..");
                      return;
                    }
                    var request = http.MultipartRequest('POST',
                        Uri.parse("${url}api/user/${user['uid']}/edit"));
                    if (newProfilepic != null) {
                      dynamic multipartFile;
                      if (kIsWeb) {
                        final reader = html.FileReader();
                        reader.readAsArrayBuffer(newProfilepic);
                        await reader.onLoad
                            .first; // Wait for the reader to finish reading.
                        // Convert the Uint8List to a List<int>.
                        final uint8List =
                            Uint8List.fromList(reader.result as List<int>);
                        multipartFile = http.MultipartFile.fromBytes(
                            "picture", uint8List,
                            filename: 'picture');
                        if (kDebugMode) {
                          print("**** Added as multipart file");
                        }
                      } else {
                        var length = await newProfilepic.length();
                        var fileStream = http.ByteStream(
                            Stream.castFrom(newProfilepic.openRead()));
                        multipartFile = http.MultipartFile(
                            'picture', fileStream, length,
                            filename: newProfilepic.path.split('/').last);
                      }
                      request.files.add(multipartFile);
                    }
                    request.fields['email'] = email.text;
                    request.fields['tanggal_lahir'] = tanggalLahir;
                    request.fields['name'] = name.text;

                    try {
                      var response = await request.send();
                      if (response.statusCode == 200) {
                        Map<String, dynamic> jsonResponse =
                            jsonDecode(await response.stream.bytesToString());
                        DatabaseHelper.instance.updateSession(
                            jsonResponse['email'],
                            jsonResponse['name'],
                            jsonResponse['dob'],
                            jsonResponse['profilePic'],
                            jsonResponse['uid'].toString(),
                            (jsonResponse['email_verified_at'] != null)
                                .toString());
                        if (kDebugMode) {
                          print('File uploaded successfully!');
                        }
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        // ignore: use_build_context_synchronously
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          title: 'Yeay!',
                          text: 'Akun berhasil diupdate',
                        );
                        setState(() {
                          editState = false;
                        });
                      } else {
                        throw 'File upload failed with status code: ${response.statusCode}';
                      }
                    } on Exception catch (e) {
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                      // ignore: use_build_context_synchronously
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: 'Oops',
                        text: 'Terjadi kesalahan pada server',
                      );
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(115, 40),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      editState = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 255, 55, 0)),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(115, 40),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Batal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(image: profilePic)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Nama",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.orange, width: 1),
                      color: Colors.white70,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        user['name'],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 6, 51, 83)),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.orange, width: 1),
                      color: Colors.white70,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        user['email'],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 6, 51, 83)),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Tanggal Lahir',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.orange, width: 1),
                      color: Colors.white70,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        user['dob'],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 6, 51, 83)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  editState = true;
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(115, 40),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                'Edit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  void initState() {
    getData();
    checkEmailVerified();
    super.initState();
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
          'Profil',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      drawer: const BurgerList(),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/Profil.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(32.0),
          width: 350,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.orange,
              width: 4,
            ),
            color: const Color.fromARGB(255, 6, 52, 83),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                profileContainer(),
                Container(
                    margin: const EdgeInsets.only(top: 25), child: emailNotice)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
