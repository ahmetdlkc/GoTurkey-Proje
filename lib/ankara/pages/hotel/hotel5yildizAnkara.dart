import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/ankara/pages/hotel/hotelanasayfaAnkara.dart';
import 'package:goturkey/materials/appbar.dart';

class hotel5yildizAnkarapage extends StatefulWidget {
  const hotel5yildizAnkarapage({Key? key}) : super(key: key);

  @override
  State<hotel5yildizAnkarapage> createState() => _hotel5yildizAnkarapageState();
}

class _hotel5yildizAnkarapageState extends State<hotel5yildizAnkarapage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> hotel5yildiz = [];

    final _database = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    final CollectionReference hotel5ref = _database
        .collection("Ankara")
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
            stream: hotel5ref.snapshots(),
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
                                              hotelanasayfaAnkara(
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
                                                  olanak4)),
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
