import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/adminpaneli/adminAppbar.dart';
import 'package:goturkey/adminpaneli/adminanasayfa.dart';

class adminkullanicipage extends StatefulWidget {
  const adminkullanicipage({Key? key}) : super(key: key);

  @override
  State<adminkullanicipage> createState() => _adminkullanicipageState();
}

class _adminkullanicipageState extends State<adminkullanicipage> {
  bool eminMisin = false;

  @override
  Widget build(BuildContext context) {
    List<dynamic> kullaniciList = [];
    final _database = FirebaseFirestore.instance;

    final CollectionReference kullaniciRef =
        _database.collection("Kullanıcılar");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7EEF5),
        appBar: AppBar(
          backgroundColor: Color(0xffE7EEF5),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => adminanasayfapage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 25),
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Color(0xff2C1E40),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20, right: 55),
            child: Center(
              child: Text(
                "Kullanıcılar",
                style: TextStyle(
                  color: Color(0xff2C1E40),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: kullaniciRef.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
            if (!asyncSnapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var querySnappshot = asyncSnapshot.data;
              var kullanicilar = querySnappshot!.docs;
              var mapdata = kullanicilar.forEach((doc) async {
                var veri = doc.data() as Map<dynamic, dynamic>;

                kullaniciList.add(veri);
              });

              return ListView.builder(
                  itemCount: kullaniciList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: 30, left: 30, top: 20),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 99, 184, 230),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${kullaniciList[index]["kullaniciAdi"]}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "${kullaniciList[index]["eposta"]}"),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: IconButton(
                                      onPressed: () async {
                                        await _showMyDialog();
                                        if (eminMisin == true) {
                                          await kullanicilar[index]
                                              .reference
                                              .delete();
                                          eminMisin = false;
                                          kullaniciList.clear;
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    adminkullanicipage()),
                                            (Route<dynamic> route) => false,
                                          );
                                        } else {
                                          return;
                                        }
                                      },
                                      icon: Icon(
                                        Icons.clear,
                                        color: Colors.red,
                                        size: 35,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          },
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
