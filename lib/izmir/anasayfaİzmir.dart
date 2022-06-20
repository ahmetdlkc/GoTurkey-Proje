import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/arasecimler/sehirsec.dart';
import 'package:goturkey/izmir/pages/hotel/hotelyildizIzmir.dart';
import 'package:goturkey/izmir/pages/manzaralar/manzaralaranasayfaIzmir.dart';
import 'package:goturkey/izmir/pages/materials/navigationIzmir.dart';
import 'package:goturkey/izmir/pages/restorant/restorananaIzmir.dart';
import 'package:goturkey/izmir/pages/tarihiyerler/tarihiyerleranasayfaIzmir.dart';
import 'package:goturkey/izmir/pages/tarihiyerler/tarihiyerlerdetaysayfaIzmir.dart';
import 'package:goturkey/materials/anasayfaAppbar.dart';

class anasayfaizmirpage extends StatefulWidget {
  const anasayfaizmirpage({Key? key}) : super(key: key);

  @override
  State<anasayfaizmirpage> createState() => _anasayfaizmirpageState();
}

class _anasayfaizmirpageState extends State<anasayfaizmirpage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> onerilerList1 = [];
    List<dynamic> onerilerList2 = [];

    final _database = FirebaseFirestore.instance;

    final CollectionReference tarihiyerlerRef = _database
        .collection("İzmir")
        .doc("Kategoriler")
        .collection("TarihiYerler");
    return SafeArea(
      child: Scaffold(
        appBar: anasayfaAppbar(context, "İzmir"),
        backgroundColor: Color(0xffE7EEF5),
        body: SingleChildScrollView(
          child: Column(children: [
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
                                builder: (context) => tarihiyerlerIzmirpage()));
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
                              builder: (context) => hotelyildizsecimIzmirpage(),
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
                              builder: (context) => tarihiyerlerIzmirpage(),
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
                              builder: (context) => restorananaIzmir(),
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
                              builder: (context) => manzaralaranaIzmirpage(),
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
                          .where("adi", isEqualTo: "Smyrna Antik Kenti")
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
                                      tarihiyerlerdetayIzmirpage(adi, adres,
                                          fotograf, hakkinda, semt, ulasim)),
                            );
                          },
                          child: populeryerlerolustur(
                              "assets/images/izmirEfesAntik.jpg",
                              "Efes\nAntik Kenti"),
                        );
                      }),
                  SizedBox(
                    width: 15,
                  ),
                  FutureBuilder<QuerySnapshot>(
                      future: tarihiyerlerRef
                          .where("adi", isEqualTo: "İzmir Saat Kulesi")
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
                                      tarihiyerlerdetayIzmirpage(adi, adres,
                                          fotograf, hakkinda, semt, ulasim)),
                            );
                          },
                          child: populeryerlerolustur(
                              "assets/images/izmirSaatKulesi.jpg",
                              "İzmir\nSaat Kulesi"),
                        );
                      }),
                ],
              ),
            ),
          ]),
        ),
        bottomNavigationBar: navigatoinIzmir(),
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
