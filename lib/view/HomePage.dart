import 'package:flutter/material.dart';
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
                            Padding(padding: EdgeInsets.only(top: 24.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(5, (index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Container(
                                      width: 250,
                                      height: 210,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(1),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.only(top: 24.0),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Januari',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8.0),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                                  child: Text(
                                                    'lorem ipsum',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 24.0)),
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
                                      color: const Color.fromARGB(
                                          255, 2, 124, 204),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Sekilas Informasi',
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
                            Padding(padding: EdgeInsets.only(top: 24.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 160,
                                  height: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(96),
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24)),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 2, 124, 204),
                                      width: 2,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Materi Sharing',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    child: Image.asset(
                                                      'assets/image/Materi_Sharing.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: InkWell(
                                          onTap: () {
                                            // Tindakan yang ingin dilakukan saat tombol "Selengkapnya" diklik
                                            print(
                                                'Tombol "Selengkapnya" diklik!');
                                            // Panggil fungsi atau lakukan tindakan yang diinginkan di sini
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  const Color.fromARGB(
                                                      255, 2, 124, 204),
                                                  const Color.fromARGB(
                                                      255, 95, 220, 216)
                                                ],
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Selengkapnya',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(
                                        16.0)), // Jarak antara kedua container
                                Container(
                                  width: 160,
                                  height: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(96),
                                        topRight: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24)),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 2, 124, 204),
                                      width: 2,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                '          Kinerja',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    child: Image.asset(
                                                      'assets/image/Kinerja.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: InkWell(
                                          onTap: () {
                                            // Tindakan yang ingin dilakukan saat tombol "Selengkapnya" diklik
                                            print(
                                                'Tombol "Selengkapnya" diklik!');
                                            // Panggil fungsi atau lakukan tindakan yang diinginkan di sini
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  const Color.fromARGB(
                                                      255, 2, 124, 204),
                                                  const Color.fromARGB(
                                                      255, 95, 220, 216)
                                                ],
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Selengkapnya',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
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
                            Padding(padding: EdgeInsets.only(top: 32.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 160,
                                  height: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(96),
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24)),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 2, 124, 204),
                                      width: 2,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Aktivitas         ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    child: Image.asset(
                                                      'assets/image/Aktivitas.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: InkWell(
                                          onTap: () {
                                            // Tindakan yang ingin dilakukan saat tombol "Selengkapnya" diklik
                                            print(
                                                'Tombol "Selengkapnya" diklik!');
                                            // Panggil fungsi atau lakukan tindakan yang diinginkan di sini
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  const Color.fromARGB(
                                                      255, 2, 124, 204),
                                                  const Color.fromARGB(
                                                      255, 95, 220, 216)
                                                ],
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Selengkapnya',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(
                                        16.0)), // Jarak antara kedua container
                                Container(
                                  width: 160,
                                  height: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(96),
                                        topRight: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24)),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 2, 124, 204),
                                      width: 2,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Safety Moment',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    child: Image.asset(
                                                      'assets/image/Safety_Moment.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: InkWell(
                                          onTap: () {
                                            // Tindakan yang ingin dilakukan saat tombol "Selengkapnya" diklik
                                            print(
                                                'Tombol "Selengkapnya" diklik!');
                                            // Panggil fungsi atau lakukan tindakan yang diinginkan di sini
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  const Color.fromARGB(
                                                      255, 2, 124, 204),
                                                  const Color.fromARGB(
                                                      255, 95, 220, 216)
                                                ],
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Selengkapnya',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
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
                            Padding(padding: EdgeInsets.only(top: 24.0)),
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
                                      color: const Color.fromARGB(
                                          255, 2, 124, 204),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Tim Internalisasi Budaya',
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
                            Padding(padding: EdgeInsets.only(top: 54.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Transform.scale(
                                        scale:
                                            2.5, // Faktor skala untuk memperbesar gambar
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            'assets/image/Konsultasi.png', // Ganti dengan path gambar Anda
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 28.0)),
                                      Container(
                                        width: 140,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 26, 73, 128),
                                          borderRadius:
                                              BorderRadius.circular(12.5),
                                          border: Border.all(
                                            color:
                                                Colors.orange, // Warna outline
                                            width: 2, // Lebar outline
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Orang',
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
                                Padding(padding: EdgeInsets.all(1.0)),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Transform.scale(
                                        scale:
                                            2.5, // Faktor skala untuk memperbesar gambar
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            'assets/image/Pelatihan.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 28.0)),
                                      Container(
                                        width: 140,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 26, 73, 128),
                                          borderRadius:
                                              BorderRadius.circular(12.5),
                                          border: Border.all(
                                            color:
                                                Colors.orange, // Warna outline
                                            width: 2, // Lebar outline
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Orang',
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
                            Padding(padding: EdgeInsets.only(top: 64.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Transform.scale(
                                        scale:
                                            2.5, // Faktor skala untuk memperbesar gambar
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            'assets/image/Konsultasi.png', // Ganti dengan path gambar Anda
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 28.0)),
                                      Container(
                                        width: 140,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 26, 73, 128),
                                          borderRadius:
                                              BorderRadius.circular(12.5),
                                          border: Border.all(
                                            color:
                                                Colors.orange, // Warna outline
                                            width: 2, // Lebar outline
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Orang',
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
                                Padding(padding: EdgeInsets.all(1.0)),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Transform.scale(
                                        scale:
                                            2.5, // Faktor skala untuk memperbesar gambar
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            'assets/image/Pelatihan.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 28.0)),
                                      Container(
                                        width: 140,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 26, 73, 128),
                                          borderRadius:
                                              BorderRadius.circular(12.5),
                                          border: Border.all(
                                            color:
                                                Colors.orange, // Warna outline
                                            width: 2, // Lebar outline
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Orang',
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
                            Padding(padding: EdgeInsets.only(top: 64.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Transform.scale(
                                        scale:
                                            2.5, // Faktor skala untuk memperbesar gambar
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            'assets/image/Konsultasi.png', // Ganti dengan path gambar Anda
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 28.0)),
                                      Container(
                                        width: 140,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 26, 73, 128),
                                          borderRadius:
                                              BorderRadius.circular(12.5),
                                          border: Border.all(
                                            color:
                                                Colors.orange, // Warna outline
                                            width: 2, // Lebar outline
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Orang',
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
                                Padding(padding: EdgeInsets.all(1.0)),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Transform.scale(
                                        scale:
                                            2.5, // Faktor skala untuk memperbesar gambar
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.asset(
                                            'assets/image/Pelatihan.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 28.0)),
                                      Container(
                                        width: 140,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 26, 73, 128),
                                          borderRadius:
                                              BorderRadius.circular(12.5),
                                          border: Border.all(
                                            color:
                                                Colors.orange, // Warna outline
                                            width: 2, // Lebar outline
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Orang',
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
                            Padding(padding: EdgeInsets.only(top: 24.0)),
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
                                      color: const Color.fromARGB(
                                          255, 2, 124, 204),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Reward',
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
                            Padding(padding: const EdgeInsets.only(top: 32.0)),
                            Container(
                              width: 300,
                              height: 290,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 2,
                                ),
                                color: const Color.fromARGB(255, 6, 52, 83),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            child: Image.asset(
                                              'assets/image/Pelatihan.png',
                                              width: 120,
                                              height: 120,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 18.0)),
                                      Text(
                                        'Nama Panjang Lengkap',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'karena sangat rajin mencuci muka jadi diberikan penghargaan padahal biasa aja',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 1220,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/image/Feedback.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 245,
                                  left: 0,
                                  right: 0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(32.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Dapatkan Update Terkini",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Program Budaya Sucofindo",
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Untuk mendapatkan reminder silakan masukan email anda pada kolom dibawah ini",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 18.0)),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                color: Colors.white,
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Your Email Address',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 18.0)),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(180, 40),
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 250, 131, 15),
                                                  foregroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                child: Text(
                                                  'Subscribe Us',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 170.0)),
                                            Container(
                                              width: 350,
                                              height: 450,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color: const Color.fromARGB(
                                                    255, 26, 73, 128),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 4,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(32.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(35),
                                                        color: Colors.white,
                                                      ),
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Your Email Address',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        35),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 18.0)),
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(35),
                                                        color: Colors.white,
                                                      ),
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Your Email Address',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        35),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 18.0)),
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(35),
                                                        color: Colors.white,
                                                      ),
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Your Email Address',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        35),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 18.0)),
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(35),
                                                        color: Colors.white,
                                                      ),
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Your Email Address',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        35),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 14.0)),
                                                    Container(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10),
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize:
                                                              Size(180, 40),
                                                          backgroundColor:
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  250,
                                                                  131,
                                                                  15),
                                                          foregroundColor:
                                                              Colors.black,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                          'KIRIM',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
