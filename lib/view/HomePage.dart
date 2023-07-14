import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:inovasi_budaya/view/burger_menu.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var arr = [
    'assets/image/Siapkeakhlak.jpg',
    'assets/image/PosterAkhlak.jpg',
    'assets/image/PosterPerilakuAkhlak.jpg',
    'assets/image/Posterlandscape1.jpg',
    'assets/image/Posterlandscape2.jpg'
  ];

  void posterAkhlak(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: const Color.fromARGB(255, 6, 51, 83),
          content: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('assets/image/PosterPerilakuAkhlak.jpg'),
                );
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {}
            },
          ),
        );
      },
    );
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(2, 4),
                      ),
                    ],
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
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
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
                                                  padding: EdgeInsets.only(
                                                      bottom: 1.0),
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
                                              padding:
                                                  EdgeInsets.only(top: 48.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              Transform.scale(
                                                            scale:
                                                                1.8, // Faktor skala untuk memperbesar gambar
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                'assets/image/Inspeksi.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Container(
                                                          width: 80,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                26,
                                                                73,
                                                                128),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.5),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.orange,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Inspeksi',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              Transform.scale(
                                                            scale:
                                                                1.8, // Faktor skala untuk memperbesar gambar
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                'assets/image/Pengujian.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Container(
                                                          width: 80,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                26,
                                                                73,
                                                                128),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.5),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.orange,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Pengujian',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              Transform.scale(
                                                            scale:
                                                                1.8, // Faktor skala untuk memperbesar gambar
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                'assets/image/Sertifikasi.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Container(
                                                          width: 80,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                26,
                                                                73,
                                                                128),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.5),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.orange,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Sertifikasi',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 48.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              Transform.scale(
                                                            scale:
                                                                1.8, // Faktor skala untuk memperbesar gambar
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                'assets/image/Konsultasi.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Container(
                                                          width: 80,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                26,
                                                                73,
                                                                128),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.5),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.orange,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Konsultasi',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              Transform.scale(
                                                            scale:
                                                                1.8, // Faktor skala untuk memperbesar gambar
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                'assets/image/Pelatihan.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Container(
                                                          width: 80,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                26,
                                                                73,
                                                                128),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.5),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.orange,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Pelatihan',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                            ),
                                          ],
                                        ),
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
                          color: const Color.fromARGB(255, 26, 73, 128),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(2, 2),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.orange,
                            width: 5,
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
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: const Offset(2, 1),
                                            ),
                                          ],
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(0.4),
                                            width: 2,
                                          ),
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
                                                  fontSize: 16,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Kinerja',
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
                                                  fontSize: 16,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Aktivitas',
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
                                                  fontSize: 16,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                                  fontSize: 16,
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
                                              height: 520,
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
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 250, 131, 15),
                                                      ),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 8,
                                                          horizontal: 54),
                                                      child: Text(
                                                        'Saran',
                                                        style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 32),
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
                                                          labelText: 'Name',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
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
                                                              'Email Address',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
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
                                                                .circular(30),
                                                        color: Colors.white,
                                                      ),
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Phone',
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
                                                          labelText: 'Subject',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
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
                                                              Size(100, 35),
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
                                                                        10),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                          'KIRIM',
                                                          style: TextStyle(
                                                            fontSize: 14,
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
                                            )
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
