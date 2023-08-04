import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // String api = "http://192.168.1.124/api/";
  bool _showPassword = false;
  bool _showPassword2 = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  String dateText = "";

  @override
  Widget build(BuildContext context) {
    void successAlert() {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Yeay!',
        text: 'Akun berhasil dibuat',
        onConfirmBtnTap: () {
          Navigator.popUntil(context, (route) => false);
          Navigator.pushNamed(context, '/home');
        },
      );
    }

    void failedAlert() {
      Navigator.pop(context);

      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops',
        text: 'Pastikan data diri sudah benar dan lengkap',
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 6, 51, 83)),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Color.fromARGB(255, 250, 131, 15),
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Masukan nama anda',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Masukan tanggal lahir anda',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
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
                                      dateText =
                                          "${date?.year}-${date?.month}-${date?.day}";
                                    })
                                  },
                                );
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                alignment: Alignment.centerLeft,
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Text(dateText),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Masukan email anda',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Masukan password anda',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextField(
                                    controller: passwordController,
                                    obscureText: !_showPassword,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      _showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Verifikasi password anda',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextField(
                                    controller: passwordController2,
                                    obscureText: !_showPassword2,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      _showPassword2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _showPassword2 = !_showPassword2;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: 40, right: 20, left: 10),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.red,
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(150, 50),
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Kembali',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 40, left: 20),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.loading,
                                title: 'Loading',
                                text: 'Fetching your data',
                              );
                              var url = Uri.parse(
                                  'http://192.168.1.128:8000/api/register'); // Replace with your API endpoint
                              var headers = {
                                'Content-Type': 'application/json'
                              }; // Replace with the appropriate headers

                              var data = {
                                'email': emailController.text,
                                'password': passwordController.text,
                                'password2': passwordController2.text,
                                'tanggal_lahir': dateText,
                                'name': nameController.text
                              }; // Replace with your data

                              var response = await http.post(
                                url,
                                headers: headers,
                                body: jsonEncode(data),
                              );

                              if (response.statusCode == 200) {
                                // Successful request
                                dynamic jsonData = jsonDecode(response.body);
                                print(jsonData);
                                // DatabaseHelper.instance.saveSession(
                                //     emailController.text,
                                //     jsonData['id'],
                                //     "0",
                                //     "default.png",
                                //     userController.text);
                                successAlert();
                              } else {
                                // Error occurred
                                print(
                                    'Request failed with status: ${response.statusCode}');
                                failedAlert();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orange,
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(150, 50),
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
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
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
