import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/homepage/component/circleImageTitle.dart';
import 'package:url_launcher/url_launcher.dart';

class VisiMisi extends StatelessWidget {
  const VisiMisi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      height: 1220,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/Visi_Misi_Image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 80),
            width: 200,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.orange,
                  width: 2.0,
                ),
              ),
            ),
            child: const Text(
              'Visi & Misi',
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width * 0.85,
            margin: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: const Text(
                    'Visi',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.orange,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: const Padding(
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
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width * 0.85,
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Container(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Misi',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.orange,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: const Padding(
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
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60),
            width: MediaQuery.of(context).size.width * 0.5,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.orange,
                  width: 2.0,
                ),
              ),
            ),
            child: const Text(
              'Jasa Kami',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 35),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Avatar(
                    image: 'assets/image/Inspeksi.png', titleText: 'Inspeksi'),
                Avatar(
                    image: 'assets/image/Pengujian.png',
                    titleText: 'Pengujian'),
                Avatar(
                    image: 'assets/image/Sertifikasi.png',
                    titleText: 'Serifikasi'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 35),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Avatar(
                    image: 'assets/image/Konsultasi.png',
                    titleText: 'Konsultasi'),
                Avatar(
                    image: 'assets/image/Pelatihan.png',
                    titleText: 'Pelatihan'),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 84.0)),
          Center(
            child: ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse('https://www.sucofindo.co.id/'));
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
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 2, 124, 204),
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(200, 50),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
