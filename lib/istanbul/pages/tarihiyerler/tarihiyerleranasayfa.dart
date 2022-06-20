import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:goturkey/istanbul/pages/tarihiyerler/tarihiyerlerdetaysayfa.dart';
import 'package:goturkey/materials/appbar.dart';

class tarihiyerlerpage extends StatefulWidget {
  const tarihiyerlerpage({Key? key}) : super(key: key);

  @override
  State<tarihiyerlerpage> createState() => _tarihiyerlerpageState();
}

class _tarihiyerlerpageState extends State<tarihiyerlerpage> {
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
        appBar: appbarekle(context, "Tarihi Yerler"),
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
                var hoteller = querySnappshot!.docs;
                var mapdata = hoteller.forEach((doc) async {
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
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: InkWell(
                                  onTap: () {
                                    String adi = tarihiyerlerList[index]["adi"];
                                    String adres =
                                        tarihiyerlerList[index]["adres"];

                                    String fotograf =
                                        tarihiyerlerList[index]["fotograf"];
                                    String hakkinda =
                                        tarihiyerlerList[index]["hakkinda"];
                                    String semt =
                                        tarihiyerlerList[index]["semt"];
                                    String ulasim =
                                        tarihiyerlerList[index]["ulasim"];

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              tarihiyerlerdetaypage(
                                                  adi,
                                                  adres,
                                                  fotograf,
                                                  hakkinda,
                                                  semt,
                                                  ulasim)),
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
                                        "${tarihiyerlerList[index]["fotograf"]}",
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
