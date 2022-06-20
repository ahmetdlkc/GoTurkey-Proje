import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/tarihiyerler/admintarihiyerleranasayfa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/tarihiyerler/adminAnkaratarihiyerleranasayfa.dart';
import 'package:goturkey/adminpaneli/adminIzmir/tarihiyerler/adminIzmirtarihiyerleranasayfa.dart';

class admintarihiyerlerIzmirguncellepage extends StatefulWidget {
  final String adi, hakkinda, fotograf, adres, semt, ulasim, docid;

  const admintarihiyerlerIzmirguncellepage(this.adi, this.adres, this.fotograf,
      this.hakkinda, this.semt, this.ulasim, this.docid);

  @override
  State<admintarihiyerlerIzmirguncellepage> createState() =>
      _admintarihiyerlerIzmirguncellepageState();
}

class _admintarihiyerlerIzmirguncellepageState
    extends State<admintarihiyerlerIzmirguncellepage> {
  @override
  Widget build(BuildContext context) {
    final _adiController = TextEditingController()..text = "${widget.adi}";
    final _hakkindaController = TextEditingController()
      ..text = "${widget.hakkinda}";
    final _fotografController = TextEditingController()
      ..text = "${widget.fotograf}";
    final _adresController = TextEditingController()..text = "${widget.adres}";
    final _semtController = TextEditingController()..text = "${widget.semt}";
    final _ulasimController = TextEditingController()
      ..text = "${widget.ulasim}";

    final _database = FirebaseFirestore.instance;
    final _hotelguncellekey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7EEF5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Text(
                      "Tarihi Yer Güncelle",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              Form(
                key: _hotelguncellekey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Lütfen Sadece Güncellemek istediğiniz",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Text(
                      "alanları doldurunuz",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Tarihi yer Adı",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _adiController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7EEF5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Tarihi yer Hakkında",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _hakkindaController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7EEF5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Tarihi yer Fotoğraf",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _fotografController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7EEF5),
                          helperText: "Lütfen fotoğrafın linkini giriniz",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Tarihi yer Adres",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _adresController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7EEF5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Tarihi yer Semt",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _semtController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7EEF5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Tarihi yer Ulasim",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _ulasimController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7EEF5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _database
                            .collection("İzmir")
                            .doc("Kategoriler")
                            .collection("TarihiYerler")
                            .doc(widget.docid)
                            .update({
                          "adi": "${_adiController.text}",
                          "hakkinda": "${_hakkindaController.text}",
                          "fotograf": "${_fotografController.text}",
                          "adres": "${_adresController.text}",
                          "ulasim": "${_ulasimController.text}",
                          "semt": "${_semtController.text}",
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    admintarihiyerlerIzmiranapage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff4A9CC9),
                        onPrimary: Color(0xffE7EEF5),
                        elevation: 20, // Elevation
                        shadowColor: Color(0xff4A9CC9), // Shadow Color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 7, bottom: 7, right: 30, left: 30),
                        child: Text(
                          "Güncelle",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
