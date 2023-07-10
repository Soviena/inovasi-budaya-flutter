import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Aktivitas.dart';
import 'package:inovasi_budaya/view/Burger_Menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 51, 83),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.orange,
                ),
                iconSize: 36,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BurgerList()),
                  );
                },
              ),
              Text(
                'Homepage',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sucofindo',
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 26, 73, 128),
                    ),
                  ),
                  Text(
                    'Ber-AKHLAK',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 2, 124, 204),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Image.asset(
                    'assets/image/Akhlak.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 2, 33, 204),
                          const Color.fromARGB(255, 95, 220, 216)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi yang akan dilakukan saat tombol ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Tata Nilai Akhlak',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  height: 1220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/Visi_Misi_Image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Text(
                          'Visi & Misi',
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(42.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Visi',
                                    style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Menjadi Perusahaan kelas dunia yang kompetitif, andal dan terpercaya di bidang inspeksi, pengujian, sertifikasi, konsultasi, dan pelatihan',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                  SizedBox(height: 30),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Misi',
                                          style: TextStyle(
                                            fontSize: 36,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Menciptakan nilai ekonomi kepada para pemangku kepentingan terutama pelanggan, pemegang saham dan pegawai melalui jasa inspeksi, pengujian, sertifikasi, konsultansi serta jasa terkait lainnya untuk menjamin kepastian berusaha.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(height: 50),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Jasa Kami',
                                            style: TextStyle(
                                              fontSize: 36,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(top: 24.0)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 26, 73, 128),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.orange,
                                                      offset: Offset(2, 4),
                                                    ),
                                                  ],
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.asset(
                                                    'assets/image/Inspeksi.png', // Ganti dengan path gambar Anda
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 40),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 26, 73, 128),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.orange,
                                                      offset: Offset(2, 4),
                                                    ),
                                                  ],
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.asset(
                                                    'assets/image/Pengujian.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 40),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 26, 73, 128),
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.orange,
                                                      offset: Offset(2, 4),
                                                    ),
                                                  ],
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.asset(
                                                    'assets/image/Sertifikasi.png', // Ganti dengan path gambar Anda
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 26, 73, 128),
                                                borderRadius:
                                                    BorderRadius.circular(12.5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.orange,
                                                    offset: Offset(2, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Inspeksi',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 40),
                                            Container(
                                              width: 80,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 26, 73, 128),
                                                borderRadius:
                                                    BorderRadius.circular(12.5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.orange,
                                                    offset: Offset(2, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Pengujian',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 40),
                                            Container(
                                              width: 80,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 26, 73, 128),
                                                borderRadius:
                                                    BorderRadius.circular(12.5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.orange,
                                                    offset: Offset(2, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Sertifikasi',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
