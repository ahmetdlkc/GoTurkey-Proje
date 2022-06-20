import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/ankara/pages/manzaralar/manzaralardetayAnkara.dart';
import 'package:goturkey/materials/appbar.dart';

class manzaralaranaAnkarapage extends StatefulWidget {
  const manzaralaranaAnkarapage({Key? key}) : super(key: key);

  @override
  State<manzaralaranaAnkarapage> createState() =>
      _manzaralaranaAnkarapageState();
}

class _manzaralaranaAnkarapageState extends State<manzaralaranaAnkarapage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> manzaralarList = [];

    final _database = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    final CollectionReference manzarlarRef = _database
        .collection("Ankara")
        .doc("Kategoriler")
        .collection("Manzaralar");
    return SafeArea(
      child: Scaffold(
        appBar: appbarekle(context, "Manzaralar"),
        backgroundColor: Color(0xffE7EEF5),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: StreamBuilder<QuerySnapshot>(
            stream: manzarlarRef.snapshots(),
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
                  manzaralarList.add(veri);
                });

                return ListView.builder(
                    itemCount: manzaralarList.length,
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
                                    String adi = manzaralarList[index]["adi"];
                                    String adres =
                                        manzaralarList[index]["adres"];

                                    String fotograf =
                                        manzaralarList[index]["fotograf"];
                                    String hakkinda =
                                        manzaralarList[index]["hakkinda"];
                                    String semt = manzaralarList[index]["semt"];

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              manzaralardetayAnkarapage(
                                                  adi,
                                                  adres,
                                                  fotograf,
                                                  hakkinda,
                                                  semt)),
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
                                        "${manzaralarList[index]["fotograf"]}",
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
                                      "${manzaralarList[index]["adi"]}",
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
                                      "${manzaralarList[index]["semt"]}",
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
                                      Icons.landscape,
                                      color: Color.fromARGB(255, 133, 120, 6),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Manzaralar",
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
