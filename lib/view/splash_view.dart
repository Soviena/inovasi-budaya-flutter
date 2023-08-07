import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inovasi_budaya/dbHelper.dart';
import 'package:quickalert/quickalert.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String url = 'https://django.belajarpro.online/api/';

  void _showLoginPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController emailController = TextEditingController();
        final TextEditingController passController = TextEditingController();
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.orange, width: 2),
          ),
          backgroundColor: const Color.fromARGB(255, 6, 51, 83),
          title: const Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          content: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: passController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Batal'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Masuk'),
                      onPressed: () {
                        String email = emailController.text;
                        String password = passController.text;
                        postData(context, email, password);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void postData(context, String email, String password) async {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Loading',
      text: 'Fetching your data',
    );
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsonBody = '{"email": "$email", "password": "$password"}';

    try {
      http.Response response = await http.post(Uri.parse("${url}login"),
          headers: headers, body: jsonBody);

      if (response.statusCode == 200) {
        // Request successful
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('loggedin')) {
          DatabaseHelper.instance.saveSession(
              jsonResponse['email'],
              jsonResponse['uid'],
              jsonResponse['profilePic'],
              jsonResponse['name'],
              jsonResponse['dob'].toString());
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.popAndPushNamed(context, '/home');
        } else {
          Navigator.pop(context);

          failedAlert(context);
          return;
        }
      } else {
        if (kDebugMode) {
          print('Request failed with status code: ${response.statusCode}');
        }
        Navigator.pop(context);
        failedAlert(context);

        return;
      }
    } catch (error) {
      if (kDebugMode) {
        print('****************Error: $error');
      }
      Navigator.pop(context);
      failedAlert(context);
    }
    return; // Return an empty map as the default response
  }

  void failedAlert(context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops',
      text: 'Pastikan data diri sudah benar dan lengkap',
    );
  }

  void getSession() async {
    dynamic value = await DatabaseHelper.instance.getSession();
    if (value != null && value['loggedin'] == 'true') {
      try {
        http.Response response =
            await http.get(Uri.parse("${url}user/get/${value['uid']}"));
        dynamic jsonVal = jsonDecode(response.body);
        DatabaseHelper.instance.updateSession(
            jsonVal['email'],
            jsonVal['name'],
            jsonVal['tanggal_lahir'],
            jsonVal['profilepic'],
            jsonVal['id'].toString());
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      // ignore: use_build_context_synchronously
      Navigator.popAndPushNamed(context, "/home");
    } else {
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/backgroundSplash_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 6, 52, 83),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'APLIKASI',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'BUDAYA',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        'SUCOFINDO',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            _showLoginPopup(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 36, 51, 126),
                            ),
                            fixedSize: MaterialStateProperty.all<Size>(
                              const Size(170, 70),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/register");
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orange,
                            ),
                            fixedSize: MaterialStateProperty.all<Size>(
                              const Size(130, 50),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
