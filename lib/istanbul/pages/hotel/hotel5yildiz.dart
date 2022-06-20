import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goturkey/istanbul/materials/appbar%C4%B0sthotel.dart';
import 'package:goturkey/istanbul/pages/hotel/hotelanasayfa.dart';
import 'package:goturkey/materials/appbar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class hotel5yildizpage extends StatefulWidget {
  @override
  State<hotel5yildizpage> createState() => _hotel5yildizpageState();
}

class _hotel5yildizpageState extends State<hotel5yildizpage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> hotel5yildiz = [];
    TextEditingController _searchcontroller = TextEditingController();
    String docid;

    final _database = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    final CollectionReference kategoriRef = _database
        .collection("Kategoriler")
        .doc("Hoteller")
        .collection("5_Yıldızlı");

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE7EEF5),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 25),
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Color(0xff2C1E40),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 40,
              width: 270,
              child: TextField(
                controller: _searchcontroller,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  labelText: "5 Yıldızlı Hoteller",
                  hintText: "Hotel Arayınız",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xffE7EEF5),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
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
                                    String olanak5 =
                                        hotel5yildiz[index]["Olanak5"];

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              hotelanasayfapage(
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
                                                  olanak5)),
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
