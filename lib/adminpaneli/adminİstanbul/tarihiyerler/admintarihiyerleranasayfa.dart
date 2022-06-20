import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/admin%C4%B0stanbulanasayfa.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/tarihiyerler/admintarihiyerlerguncellesayfa.dart';

class admintarihiyerlerIstanapage extends StatefulWidget {
  const admintarihiyerlerIstanapage({Key? key}) : super(key: key);

  @override
  State<admintarihiyerlerIstanapage> createState() =>
      _admintarihiyerlerIstanapageState();
}

enum MenuItem {
  guncelle,
  sil,
}

class _admintarihiyerlerIstanapageState
    extends State<admintarihiyerlerIstanapage> {
  bool eminMisin = false;
  @override
  Widget build(BuildContext context) {
    List<dynamic> tarihiyerlerList = [];
    String docid;

    final _database = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    final CollectionReference tarihiyerlerRef = _database
        .collection("Kategoriler")
        .doc("TarihiYerlerİstanbul")
        .collection("TarihiYerlerİstanbul");
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
                      builder: (context) => adminIstanbulanapage()));
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
            padding: const EdgeInsets.only(top: 10, left: 50),
            child: Text(
              "Tarihi Yerler",
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
            stream: tarihiyerlerRef.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
              if (!asyncSnapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var querySnappshot = asyncSnapshot.data;
                var tarihiyerler = querySnappshot!.docs;
                var mapdata = tarihiyerler.forEach((doc) async {
                  docid = doc.id;
                  var veri = doc.data() as Map<dynamic, dynamic>;
                  tarihiyerlerList.add(veri);
                });

                return ListView.builder(
                    itemCount: tarihiyerlerList.length,
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
                              String docid = await tarihiyerler[index].id;
                              String adi = tarihiyerlerList[index]["adi"];
                              String adres = tarihiyerlerList[index]["adres"];

                              String fotograf =
                                  tarihiyerlerList[index]["fotograf"];
                              String hakkinda =
                                  tarihiyerlerList[index]["hakkinda"];
                              String semt = tarihiyerlerList[index]["semt"];
                              String ulasim = tarihiyerlerList[index]["ulasim"];

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        admintarihiyerlerIstguncellepage(
                                            adi,
                                            adres,
                                            fotograf,
                                            hakkinda,
                                            semt,
                                            ulasim,
                                            docid)),
                              );
                            } else if (value == MenuItem.sil) {
                              await _showMyDialog();
                              if (eminMisin == true) {
                                await tarihiyerler[index].reference.delete();
                                eminMisin = false;
                                tarihiyerlerList.clear;
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          adminIstanbulanapage()),
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
                                        "${tarihiyerlerList[index]["fotograf"]}",
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
                                        "${tarihiyerlerList[index]["adi"]}",
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
                                        "${tarihiyerlerList[index]["semt"]}",
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
                                        Icons.mosque,
                                        color: Colors.green,
                                        size: 22,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Tarihi Yerler",
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
