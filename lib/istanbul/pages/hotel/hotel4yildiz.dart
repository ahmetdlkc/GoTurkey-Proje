import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/istanbul/pages/hotel/hotelanasayfa.dart';
import 'package:goturkey/materials/appbar.dart';

class hotel4yildizpage extends StatefulWidget {
  @override
  State<hotel4yildizpage> createState() => _hotel4yildizpageState();
}

class _hotel4yildizpageState extends State<hotel4yildizpage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> hotel4yildiz = [];
    List<String> docid = [];

    final _database = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    final CollectionReference kategoriRef = _database
        .collection("Kategoriler")
        .doc("Hoteller")
        .collection("4_Yıldızlı");

    return SafeArea(
      child: Scaffold(
        appBar: appbarekle(context, "4 Yıldızlı Hoteller"),
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
                  var veri = doc.data() as Map<dynamic, dynamic>;
                  hotel4yildiz.add(veri);
                  docid.add(doc.id);
                });

                return ListView.builder(
                    itemCount: hotel4yildiz.length,
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
                                    String adi = hotel4yildiz[index]["adi"];
                                    String adres = hotel4yildiz[index]["adres"];
                                    int fiyat = hotel4yildiz[index]["fiyat"];
                                    String fotograf =
                                        hotel4yildiz[index]["fotograf"];
                                    String hakkinda =
                                        hotel4yildiz[index]["hakkinda"];
                                    String puan = hotel4yildiz[index]["puan"];
                                    int tel = hotel4yildiz[index]["tel"];
                                    String olanak1 =
                                        hotel4yildiz[index]["Olanak1"];
                                    String olanak2 =
                                        hotel4yildiz[index]["Olanak2"];
                                    String olanak3 =
                                        hotel4yildiz[index]["Olanak3"];
                                    String olanak4 =
                                        hotel4yildiz[index]["Olanak4"];
                                    String olanak5 =
                                        hotel4yildiz[index]["Olanak5"];

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
                                        "${hotel4yildiz[index]["fotograf"]}",
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
                                      "${hotel4yildiz[index]["adi"]}",
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
                                      "${hotel4yildiz[index]["puan"]}",
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
