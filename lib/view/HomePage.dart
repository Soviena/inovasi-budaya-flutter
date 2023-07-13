import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void posterAkhlak(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: const Color.fromARGB(255, 6, 51, 83),
            title: const Center(),
          );
        },
      );
    }

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
          'Homepage',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      drawer: const BurgerList(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sucofindo',
                  style: TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 26, 73, 128),
                  ),
                ),
                const Text(
                  'Ber-AKHLAK',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 124, 204),
                  ),
                ),
                const SizedBox(height: 16.0),
                Image.asset(
                  'assets/image/Akhlak.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 2, 33, 204),
                        Color.fromARGB(255, 95, 220, 216)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      posterAkhlak(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
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
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                height: 1220,
                decoration: const BoxDecoration(
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
                    const DecoratedBox(
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
                      margin: const EdgeInsets.all(42.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Visi',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const DecoratedBox(
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
                                const SizedBox(height: 30),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Misi',
                                        style: TextStyle(
                                          fontSize: 36,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const DecoratedBox(
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
                                      const SizedBox(height: 50),
                                      const Align(
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
                                      const Padding(
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
                                                const SizedBox(height: 8),
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
                                                  child: const Center(
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
                                          const SizedBox(width: 40),
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
                                                const SizedBox(height: 8),
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
                                                  child: const Center(
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
                                          const SizedBox(width: 40),
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
                                                const SizedBox(height: 8),
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
                                                  child: const Center(
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
                                      const Padding(
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
                                                const SizedBox(height: 8),
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
                                                  child: const Center(
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
                                          const SizedBox(width: 40),
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
                                                const SizedBox(height: 8),
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
                                                  child: const Center(
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
                                      const Padding(
                                          padding: EdgeInsets.only(top: 84.0)),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            launchUrl(Uri.parse(
                                                'https://www.sucofindo.co.id/'));
                                          },
                                          child: const Text(
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
                                              const Color.fromARGB(
                                                  255, 2, 124, 204),
                                            ),
                                            fixedSize:
                                                MaterialStateProperty.all<Size>(
                                              const Size(200, 50),
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
                        padding: const EdgeInsets.all(3),
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
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.orange,
                            ),
                            Container(
                              width: 230,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: const Color.fromARGB(255, 2, 124, 204),
                              ),
                              child: const Center(
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
                      const Padding(padding: EdgeInsets.only(top: 18.0)),
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
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Kegiatan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 12.0)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    margin:
                                        const EdgeInsets.only(top: 8, right: 8),
                                  ),
                                  const Text(
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
                      const Padding(padding: EdgeInsets.only(top: 32.0)),
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
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
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
                                  child: const Center(
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
                            const Padding(padding: EdgeInsets.only(top: 24.0)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(5, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
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
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        padding:
                                            const EdgeInsets.only(top: 24.0),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 50,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.blue,
                                                  ),
                                                  child: const Center(
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
                                            const SizedBox(height: 8.0),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16.0),
                                                  child: const Text(
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
