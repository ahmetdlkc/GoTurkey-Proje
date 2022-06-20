import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goturkey/istanbul/pages/hotel/hotelanasayfa.dart';
import 'package:goturkey/izmir/pages/hotel/hotelanasayfaIzmir.dart';
import 'package:goturkey/materials/appbar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class hotel5yildizIzmirpage extends StatefulWidget {
  @override
  State<hotel5yildizIzmirpage> createState() => _hotel5yildizIzmirpageState();
}

class _hotel5yildizIzmirpageState extends State<hotel5yildizIzmirpage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> hotel5yildiz = [];
    String docid;

    final _database = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    final CollectionReference kategoriRef = _database
        .collection("İzmir")
        .doc("Kategoriler")
        .collection("Hotel")
        .doc("5_Yıldızlı")
        .collection("5_Yıldızlı");

    return SafeArea(
      child: Scaffold(
        appBar: appbarekle(context, "5 Yıldızlı Hoteller"),
        backgroundColor: Color(0xffE7EEF5),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: StreamBuilder<QuerySnapshot>(
            stream: kategoriRef.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
              if (!asyncSnapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var querySnappshot = asyncSnapshot.data;
                var hoteller = querySnappshot!.docs;
                var mapdata = hoteller.forEach((doc) async {
                  docid = doc.id;
                  var veri = doc.data() as Map<dynamic, dynamic>;
                  hotel5yildiz.add(veri);
                });

                return ListView.builder(
                    itemCount: hotel5yildiz.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 40,
                          left: 40,
                          bottom: 15,
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: InkWell(
                                  onTap: () {
                                    String adi = hotel5yildiz[index]["adi"];
                                    String adres = hotel5yildiz[index]["adres"];
                                    int fiyat = hotel5yildiz[index]["fiyat"];
                                    String fotograf =
                                        hotel5yildiz[index]["fotograf"];
                                    String hakkinda =
                                        hotel5yildiz[index]["hakkinda"];
                                    String puan = hotel5yildiz[index]["puan"];
                                    int tel = hotel5yildiz[index]["tel"];
                                    String olanak1 =
                                        hotel5yildiz[index]["Olanak1"];
                                    String olanak2 =
                                        hotel5yildiz[index]["Olanak2"];
                                    String olanak3 =
                                        hotel5yildiz[index]["Olanak3"];
                                    String olanak4 =
                                        hotel5yildiz[index]["Olanak4"];

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              hotelanasayfapageIzmir(
                                                adi,
                                                adres,
                                                fiyat,
                                                fotograf,
                                                hakkinda,
                                                puan,
                                                tel,
                                                olanak1,
                                                olanak2,
                                                olanak3,
                                                olanak4,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 4,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.network(
                                        "${hotel5yildiz[index]["fotograf"]}",
                                        width: 300,
                                        height: 150,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${hotel5yildiz[index]["adi"]}",
                                      style: TextStyle(
                                          color: Color(0xff2C1E40),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${hotel5yildiz[index]["puan"]}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.bed,
                                      color: Color(0xff4A9CC9),
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Hotel",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}

/*hotelekle(
                          hotel5yildiz[index]["fotograf"],
                          hotel5yildiz[index]["adi"],
                          hotel5yildiz[index]["puan"]);
*/
