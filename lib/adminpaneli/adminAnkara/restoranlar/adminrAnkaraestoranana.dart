import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/admin%C4%B0stanbulanasayfa.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/restoranlar/adminrestoranIstguncellesayfa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/adminAnkaraanasayfa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/restoranlar/adminrestoranAnkaraguncellesayfa.dart';

class adminrestoranAnkarapage extends StatefulWidget {
  const adminrestoranAnkarapage({Key? key}) : super(key: key);

  @override
  State<adminrestoranAnkarapage> createState() =>
      _adminrestoranAnkarapageState();
}

enum MenuItem {
  guncelle,
  sil,
}

class _adminrestoranAnkarapageState extends State<adminrestoranAnkarapage> {
  bool eminMisin = false;
  @override
  Widget build(BuildContext context) {
    List<dynamic> restorantList = [];

    final _database = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    final CollectionReference restorantref = _database
        .collection("Ankara")
        .doc("Kategoriler")
        .collection("Restoran");
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
                      builder: (context) => adminAnkaraanapage()));
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
            padding: const EdgeInsets.only(top: 10, left: 65),
            child: Text(
              "Restoranlar",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
        ),
        backgroundColor: Color(0xffE7EEF5),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: StreamBuilder<QuerySnapshot>(
            stream: restorantref.snapshots(),
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
                  restorantList.add(veri);
                });

                return ListView.builder(
                    itemCount: restorantList.length,
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
                              String adi = restorantList[index]["adi"];
                              String adres = restorantList[index]["adres"];

                              String fotograf =
                                  restorantList[index]["fotograf"];
                              String beslenmetur =
                                  restorantList[index]["beslenmetur"];
                              String fiyat = restorantList[index]["fiyat"];
                              String mutfak = restorantList[index]["mutfak"];
                              String semt = restorantList[index]["semt"];
                              int tel = restorantList[index]["tel"];

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        adminrestoranAnkaraguncelpage(
                                            adi,
                                            adres,
                                            fotograf,
                                            mutfak,
                                            fiyat,
                                            beslenmetur,
                                            tel,
                                            semt,
                                            docid)),
                              );
                            } else if (value == MenuItem.sil) {
                              await _showMyDialog();
                              if (eminMisin == true) {
                                await hoteller[index].reference.delete();
                                eminMisin = false;
                                restorantList.clear;
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          adminrestoranAnkarapage()),
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
                            ),
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
                                        "${restorantList[index]["fotograf"]}",
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
                                        "${restorantList[index]["adi"]}",
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
                                        Icons.pin_drop,
                                        color: Color(0xff4A9CC9),
                                        size: 22,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${restorantList[index]["semt"]}",
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
                                        Icons.restaurant_menu,
                                        color: Color.fromARGB(255, 133, 120, 6),
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Restorantlar",
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
