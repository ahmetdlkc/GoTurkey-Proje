import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/ankara/pages/hotel/hotelyildizAnkara.dart';
import 'package:goturkey/ankara/pages/manzaralar/manzaralaranaAnkara.dart';
import 'package:goturkey/ankara/pages/materials/navigation.dart';
import 'package:goturkey/ankara/pages/restorant/restorananaAnkara.dart';
import 'package:goturkey/ankara/pages/tarihiyerler/tarihiyerleranaAnkara.dart';
import 'package:goturkey/ankara/pages/tarihiyerler/tarihiyerlerdetayAnkara.dart';
import 'package:goturkey/arasecimler/sehirsec.dart';

class anasayfaAnkarapage extends StatefulWidget {
  const anasayfaAnkarapage({Key? key}) : super(key: key);

  @override
  State<anasayfaAnkarapage> createState() => _anasayfaAnkarapageState();
}

class _anasayfaAnkarapageState extends State<anasayfaAnkarapage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> onerilerList1 = [];
    List<dynamic> onerilerList2 = [];

    final _database = FirebaseFirestore.instance;

    final CollectionReference tarihiyerlerRef = _database
        .collection("Ankara")
        .doc("Kategoriler")
        .collection("TarihiYerler");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7EEF5),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 140),
                  child: Row(
                    children: [
                      Icon(
                        Icons.pin_drop,
                        size: 20,
                        color: Color(0xff4A9CC9),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => sehirsecpage(),
                            ),
                          );
                        },
                        child: Text(
                          "Ankara",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2C1E40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 25),
                  child: Icon(
                    Icons.more_vert,
                    size: 25,
                    color: Color(0xff2C1E40),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 320,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 99, 184, 230),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Text(
                      "Haydi Etrafı Keşfet",
                      style: TextStyle(
                          color: Color(0xffE7EEF5),
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Gezilecek en iyi yeri bul",
                      style: TextStyle(
                          color: Color(0xffB7D1E6),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    tarihiyerleranaAnkarapage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, top: 10, bottom: 10),
                        child: Text(
                          "Şimdi Başla",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffE7EEF5),
                          onPrimary: Color.fromARGB(255, 60, 172, 232),
                          elevation: 20, // Elevation
                          shadowColor: Color(0xffE7EEF5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 37, top: 25),
              child: Row(
                children: [
                  Text(
                    "Kategori",
                    style: TextStyle(
                        color: Color(0xff2C1E40),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 35, left: 35),
              child: Container(
                height: 150,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => hotelyildizAnkarapage(),
                            ),
                          );
                        },
                        child: categoryolustur("Hotels", Icons.bed,
                            Color.fromARGB(255, 71, 170, 102)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tarihiyerleranaAnkarapage(),
                            ),
                          );
                        },
                        child: categoryolustur("Historical\n  places",
                            Icons.mosque, Color.fromARGB(255, 51, 99, 124)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => restorananaAnkarapage(),
                            ),
                          );
                        },
                        child: categoryolustur(
                            "Restaurant",
                            Icons.restaurant_menu,
                            Color.fromARGB(255, 238, 143, 70)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => manzaralaranaAnkarapage(),
                            ),
                          );
                        },
                        child: categoryolustur("Landscape", Icons.landscape,
                            Color.fromRGBO(213, 221, 60, 1)),
                      )
                    ],
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: Row(
                children: [
                  Text(
                    "Popüler Yerler",
                    style: TextStyle(
                        color: Color(0xff2C1E40),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  FutureBuilder<QuerySnapshot>(
                      future: tarihiyerlerRef
                          .where("adi", isEqualTo: "Anıtkabir")
                          .get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var query = snapshot.data;
                          query!.docs.forEach((doc) async {
                            var veri =
                                await doc.data() as Map<dynamic, dynamic>;
                            onerilerList1.add(veri);
                          });
                        }
                        return InkWell(
                          onTap: () {
                            String adi = onerilerList1[0]["adi"];
                            String adres = onerilerList1[0]["adres"];

                            String fotograf = onerilerList1[0]["fotograf"];
                            String hakkinda = onerilerList1[0]["hakkinda"];
                            String semt = onerilerList1[0]["semt"];
                            String ulasim = onerilerList1[0]["ulasim"];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      tarihiyerlerdetayAnkarapage(adi, adres,
                                          fotograf, hakkinda, semt, ulasim)),
                            );
                          },
                          child: populeryerlerolustur(
                              "assets/images/anitkabir.jpg", "\nAnıtkabir"),
                        );
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  FutureBuilder<QuerySnapshot>(
                      future: tarihiyerlerRef
                          .where("adi", isEqualTo: "Kocatepe Cami")
                          .get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var query = snapshot.data;
                          query!.docs.forEach((doc) async {
                            var veri =
                                await doc.data() as Map<dynamic, dynamic>;
                            onerilerList2.add(veri);
                          });
                        }
                        return InkWell(
                          onTap: () {
                            String adi = onerilerList2[0]["adi"];
                            String adres = onerilerList2[0]["adres"];

                            String fotograf = onerilerList2[0]["fotograf"];
                            String hakkinda = onerilerList2[0]["hakkinda"];
                            String semt = onerilerList2[0]["semt"];
                            String ulasim = onerilerList2[0]["ulasim"];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      tarihiyerlerdetayAnkarapage(adi, adres,
                                          fotograf, hakkinda, semt, ulasim)),
                            );
                          },
                          child: populeryerlerolustur(
                              "assets/images/KocatepeCamiAnkara.jpg",
                              "\nKocatepe Camii"),
                        );
                      }),
                ],
              ),
            ),
          ]),
        ),
        bottomNavigationBar: navigatoinAnkara(),
      ),
    );
  }
}

Padding populeryerlerolustur(String resimadresi, String yeradi) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      children: [
        Container(
          width: 150,
          height: 220,
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "$resimadresi",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 160, left: 10),
              child: Text(
                "$yeradi",
                style: TextStyle(
                    color: Color(0xffE7EEF5),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}

Padding categoryolustur(
    String categoryad, IconData categoryIcon, Color categoryrenk) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Container(
      height: 120,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color.fromARGB(255, 117, 201, 246).withOpacity(0.4),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: categoryrenk,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  categoryIcon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(categoryad),
          ),
        ],
      ),
    ),
  );
}
