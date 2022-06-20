import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/admin%C4%B0stanbulanasayfa.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/hoteller/adminhotelguncellesayfasi.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/hoteller/adminhotelyildizsayfasi.dart';
import 'package:goturkey/adminpaneli/adminAnkara/hoteller/adminhotel5yildizguncelleAnkarasayfasi.dart';
import 'package:goturkey/adminpaneli/adminAnkara/hoteller/adminhotelyildizAnkarasayfasi.dart';
import 'package:goturkey/adminpaneli/adminIzmir/hoteller/adminhotel5yildizguncelleIzmirsayfasi.dart';
import 'package:goturkey/adminpaneli/adminIzmir/hoteller/adminhotelyildizIzmirsayfasi.dart';
import 'package:goturkey/istanbul/pages/hotel/hotelanasayfa.dart';

class admin5yildizlihotelIzmirpage extends StatefulWidget {
  const admin5yildizlihotelIzmirpage({Key? key}) : super(key: key);

  @override
  State<admin5yildizlihotelIzmirpage> createState() =>
      _admin5yildizlihotelIzmirpageState();
}

enum MenuItem {
  guncelle,
  sil,
}

class _admin5yildizlihotelIzmirpageState
    extends State<admin5yildizlihotelIzmirpage> {
  bool eminMisin = false;
  @override
  Widget build(BuildContext context) {
    List<dynamic> hotel5yildiz = [];
    TextEditingController _searchcontroller = TextEditingController();
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
        appBar: AppBar(
          backgroundColor: Color(0xffE7EEF5),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => adminhotelIzmiryildizpage()));
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
            padding: const EdgeInsets.only(top: 10, left: 30),
            child: Text(
              "5 Yıldızlı Hoteller",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
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
                        child: PopupMenuButton<MenuItem>(
                          onSelected: (value) async {
                            if (value == MenuItem.guncelle) {
                              String docid = await hoteller[index].id;
                              String adi = hotel5yildiz[index]["adi"];
                              String adres = hotel5yildiz[index]["adres"];
                              int fiyat = hotel5yildiz[index]["fiyat"];
                              String fotograf = hotel5yildiz[index]["fotograf"];
                              String hakkinda = hotel5yildiz[index]["hakkinda"];
                              String puan = hotel5yildiz[index]["puan"];
                              int tel = hotel5yildiz[index]["tel"];
                              String olanak1 = hotel5yildiz[index]["Olanak1"];
                              String olanak2 = hotel5yildiz[index]["Olanak2"];
                              String olanak3 = hotel5yildiz[index]["Olanak3"];
                              String olanak4 = hotel5yildiz[index]["Olanak4"];

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        adminhotel5yildizguncelleIzmirpage(
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
                                            docid)),
                              );
                            } else if (value == MenuItem.sil) {
                              await _showMyDialog();
                              if (eminMisin == true) {
                                await hoteller[index].reference.delete();
                                eminMisin = false;
                                hotel5yildiz.clear;
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          admin5yildizlihotelIzmirpage()),
                                  (Route<dynamic> route) => false,
                                );
                              } else {
                                return;
                              }
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: MenuItem.guncelle,
                              child: Text("Güncelle"),
                            ),
                            PopupMenuItem(
                              value: MenuItem.sil,
                              child: Text("Sil"),
                            )
                          ],
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ONAY GEREKİYOR'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Silmek istediğine emin misin ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hayır'),
              onPressed: () {
                eminMisin = false;
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: () {
                eminMisin = true;
                Navigator.of(context).pop();
              },
              child: Text("Evet"),
            ),
          ],
        );
      },
    );
  }
}
