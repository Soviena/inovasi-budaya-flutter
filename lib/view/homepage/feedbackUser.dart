// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/dbHelper.dart';
import 'package:quickalert/quickalert.dart';
import 'package:http/http.dart' as http;

class FeedbackUser extends StatefulWidget {
  const FeedbackUser({super.key});

  @override
  State<FeedbackUser> createState() => _FeedbackUserState();
}

class _FeedbackUserState extends State<FeedbackUser> {
  final TextEditingController subjectTextController = TextEditingController();
  final TextEditingController feedbackTextController = TextEditingController();

  void successAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Yeay!',
      text: 'Feedback berhasil dikirim',
      onConfirmBtnTap: () {
        subjectTextController.text = "";
        feedbackTextController.text = "";
        Navigator.pop(context);
      },
    );
  }

  void failedAlert(String text) {
    Navigator.pop(context);

    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops',
      text: text,
    );
  }

  void postFeedback() async {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Loading',
      text: 'Loading untuk mengirimkan ke server',
    );
    if (subjectTextController.text == "") {
      failedAlert("Subject nya bisa di isi dulu ya..");
      return;
    } else if (feedbackTextController.text == "") {
      failedAlert("Feedback tidak boleh kosong jika ingin mengirim :)");
      return;
    }
    dynamic sessionData = await DatabaseHelper.instance.getSession();
    // ignore: use_build_context_synchronously
    var url = Uri.parse(
        'https://django.belajarpro.online/api/feedback/new'); // Replace with your API endpoint
    var headers = {
      'Content-Type': 'application/json'
    }; // Replace with the appropriate headers

    var data = {
      'user_id': sessionData['uid'],
      'judul': subjectTextController.text,
      'deskripsi': feedbackTextController.text,
    }; // Replace with your data

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      successAlert();
    } else {
      // Error occurred
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}');
      }
      // ignore: use_build_context_synchronously
      failedAlert("Kesalahan jaringan, kode : ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      constraints: const BoxConstraints(minHeight: 1220),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/Feedback.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  const Text(
                    "Dapatkan Update Terkini",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Program Budaya Sucofindo",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  const Text(
                    "Untuk mendapatkan reminder silakan tekan tombol dibawah ini",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Your Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(180, 40),
                        backgroundColor:
                            const Color.fromARGB(255, 250, 131, 15),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Subscribe Us',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 140),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: 350,
              height: 520,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color.fromARGB(255, 26, 73, 128),
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 250, 131, 15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 54),
                      child: const Text(
                        'Saran',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: subjectTextController,
                        decoration: InputDecoration(
                          hintText: 'Subject',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: feedbackTextController,
                        minLines: 10,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Isi Feedback',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          postFeedback();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 35),
                          backgroundColor:
                              const Color.fromARGB(255, 250, 131, 15),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'KIRIM',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
