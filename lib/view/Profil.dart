import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/Burger_Menu.dart';

class Profile extends StatelessWidget {
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
              'Profil',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/profil.png"),
                    fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 6, 51, 83),
                  border: Border.all(color: Colors.black, width: 2)),
              child: Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(10, 90, 0, 10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 195),
                        child: Text(
                          'Nama',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 230,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.orange, width: 1),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 40, left: 2),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 230,
                        margin: EdgeInsets.only(bottom: 250, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.orange, width: 1),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 100, left: 2),
                        child: Text(
                          'Tanggal Lahir',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 230,
                        margin: EdgeInsets.only(bottom: 200, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.orange, width: 1),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 100),
                //   child: Column(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                //         child: Text(
                //           'Email',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         height: 30,
                //         width: 230,
                //         margin: EdgeInsets.only(bottom: 100),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(5),
                //           border: Border.all(color: Colors.orange, width: 1),
                //           color: Colors.white,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 10),
                //   child: Column(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                //         child: Row(
                //           children: [
                //             Text(
                //               'Tanggal Lahir',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         height: 30,
                //         width: 230,
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(5),
                //           border: Border.all(color: Colors.orange, width: 1),
                //           color: Colors.white,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ]),
            ),
          ),
          Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(bottom: 550),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Color.fromARGB(255, 217, 217, 217),
                  border: Border.all(color: Colors.orange, width: 2))),
        ],
      ),
    );
  }
}
