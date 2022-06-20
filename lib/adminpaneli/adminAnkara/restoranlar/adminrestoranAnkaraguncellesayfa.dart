import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:goturkey/adminpaneli/adminAnkara/restoranlar/adminrAnkaraestoranana.dart';

class adminrestoranAnkaraguncelpage extends StatefulWidget {
  final String adi, beslenmetur, fotograf, adres, mutfak, fiyat, semt, docid;
  final int tel;

  const adminrestoranAnkaraguncelpage(
      this.adi,
      this.adres,
      this.fotograf,
      this.mutfak,
      this.fiyat,
      this.beslenmetur,
      this.tel,
      this.semt,
      this.docid);

  @override
  State<adminrestoranAnkaraguncelpage> createState() =>
      _adminrestoranAnkaraguncelpageState();
}

class _adminrestoranAnkaraguncelpageState
    extends State<adminrestoranAnkaraguncelpage> {
  @override
  Widget build(BuildContext context) {
    final _adiController = TextEditingController()..text = "${widget.adi}";
    final _beslenmeturController = TextEditingController()
      ..text = "${widget.beslenmetur}";
    final _fotografController = TextEditingController()
      ..text = "${widget.fotograf}";
    final _adresController = TextEditingController()..text = "${widget.adres}";
    final _semtController = TextEditingController()..text = "${widget.semt}";
    final _mutfakController = TextEditingController()
      ..text = "${widget.mutfak}";
    final _fiyatController = TextEditingController()..text = "${widget.fiyat}";
    final _telController = TextEditingController()..text = "${widget.tel}";

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
                      "Restoran Güncelle",
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
                            "Restoran Adı",
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
                            "Restoran Beslenme Tür",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _beslenmeturController,
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
                            "Restoran Fotoğraf",
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
                            "Restoran Adres",
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
                            "Restoran Semt",
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
                            "Restoran Fiyat",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _fiyatController,
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
                            "Restoran Mutfak",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _mutfakController,
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
                            "Restoran Tel",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _telController,
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
                            .collection("Ankara")
                            .doc("Kategoriler")
                            .collection("Restoran")
                            .doc(widget.docid)
                            .update({
                          "adi": "${_adiController.text}",
                          "beslenmetur": "${_beslenmeturController.text}",
                          "fotograf": "${_fotografController.text}",
                          "adres": "${_adresController.text}",
                          "semt": "${_semtController.text}",
                          "fiyat": "${_fiyatController.text}",
                          "mutfak": "${_mutfakController.text}",
                          "tel": int.parse(_telController.text),
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    adminrestoranAnkarapage()));
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
