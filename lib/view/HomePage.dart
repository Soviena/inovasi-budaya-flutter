import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Aktivitas.dart';
import 'package:inovasi_budaya/view/Burger_Menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.orange,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 7.0),
                                    child: Text(
                                      'Menjadi Perusahaan Kelas Dunia yang kompetitif, andal dan terpercaya di bidang inspeksi, pengujian, sertifikasi, konsultasi, dan pelatihan.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
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
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.orange,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 7.0),
                                          child: Text(
                                            'Menciptakan nilai ekonomi kepada para pemangku kepentingan terutama pelanggan, pemegang saham dan pegawai melalui jasa inspeksi, pengujian, sertifikasi, konsultansi serta jasa terkait lainnya untuk menjamin kepastian berusaha.',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 50),
                                      Align(
                                        alignment: Alignment.center,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.orange,
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 1.0),
                                            child: Text(
                                              'Jasa Kami',
                                              style: TextStyle(
                                                fontSize: 36,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 48.0)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.asset(
                                                    'assets/image/Inspeksi.png', // Ganti dengan path gambar Anda
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Container(
                                                  width: 80,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 26, 73, 128),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.5),
                                                    border: Border.all(
                                                      color: Colors
                                                          .orange, // Warna outline
                                                      width: 2, // Lebar outline
                                                    ),
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
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 40),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.asset(
                                                    'assets/image/Pengujian.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Container(
                                                  width: 80,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 26, 73, 128),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.5),
                                                    border: Border.all(
                                                      color: Colors
                                                          .orange, // Warna outline
                                                      width: 2, // Lebar outline
                                                    ),
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
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 40),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.asset(
                                                    'assets/image/Sertifikasi.png', // Ganti dengan path gambar Anda
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Container(
                                                  width: 80,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 26, 73, 128),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.5),
                                                    border: Border.all(
                                                      color: Colors
                                                          .orange, // Warna outline
                                                      width: 2, // Lebar outline
                                                    ),
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
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 36.0)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.asset(
                                                    'assets/image/Konsultasi.png', // Ganti dengan path gambar Anda
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Container(
                                                  width: 80,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 26, 73, 128),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.5),
                                                    border: Border.all(
                                                      color: Colors
                                                          .orange, // Warna outline
                                                      width: 2, // Lebar outline
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Konsultasi',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 40),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.asset(
                                                    'assets/image/Pelatihan.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Container(
                                                  width: 80,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 26, 73, 128),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.5),
                                                    border: Border.all(
                                                      color: Colors
                                                          .orange, // Warna outline
                                                      width: 2, // Lebar outline
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Pelatihan',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 84.0)),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'WEB SUCOFINDO',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Color.fromARGB(255, 2, 124, 204),
                                            ),
                                            fixedSize:
                                                MaterialStateProperty.all<Size>(
                                              Size(200, 50),
                                            ),
                                            shape: MaterialStateProperty.all<
                                                OutlinedBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
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
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 240,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.orange,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 2,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.orange,
                            ),
                            Container(
                              width: 230,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: const Color.fromARGB(255, 2, 124, 204),
                              ),
                              child: Center(
                                child: Text(
                                  'Juni',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 18.0)),
                      Container(
                        width: 320,
                        height: 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: const Color.fromARGB(255, 26, 73, 128),
                          border: Border.all(
                            color: Colors.orange,
                            width: 4,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kegiatan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 12.0)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    margin: EdgeInsets.only(top: 8, right: 8),
                                  ),
                                  Text(
                                    'Lorem ipsum',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 32.0)),
                      Container(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 240,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.orange,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 2,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  color: Colors.orange,
                                ),
                                Container(
                                  width: 230,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color:
                                        const Color.fromARGB(255, 2, 124, 204),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Jadwal Program Budaya',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    width: 280,
                                    height: 200,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(right: 12.0)),
                                  Container(
                                    width: 280,
                                    height: 200,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  Container(
                                    width: 280,
                                    height: 200,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  // Tambahkan container lainnya di sini sesuai kebutuhan
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
          )
        ],
      ),
    );
  }
}
