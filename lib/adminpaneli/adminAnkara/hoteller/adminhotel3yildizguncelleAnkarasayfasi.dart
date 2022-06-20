import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/adminpaneli/admin%C4%B0stanbul/hoteller/admin5yildizlihotelsafa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/hoteller/admin3yildizlihotelAnkarasayfa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/hoteller/admin4yildizhotelAnkarasayfa.dart';
import 'package:goturkey/adminpaneli/adminAnkara/hoteller/admin5yildizlihotelsAnkaraafa.dart';

class adminhotel3yildizguncelleAnkarapage extends StatefulWidget {
  final String adi,
      hakkinda,
      fotograf,
      adres,
      puan,
      olanak1,
      olanak2,
      olanak3,
      olanak4,
      docid;
  final int tel, fiyat;
  const adminhotel3yildizguncelleAnkarapage(
      this.adi,
      this.adres,
      this.fiyat,
      this.fotograf,
      this.hakkinda,
      this.puan,
      this.tel,
      this.olanak1,
      this.olanak2,
      this.olanak3,
      this.olanak4,
      this.docid);

  @override
  State<adminhotel3yildizguncelleAnkarapage> createState() =>
      _adminhotel3yildizguncelleAnkarapageState();
}

class _adminhotel3yildizguncelleAnkarapageState
    extends State<adminhotel3yildizguncelleAnkarapage> {
  @override
  Widget build(BuildContext context) {
    final _adiController = TextEditingController()..text = "${widget.adi}";
    final _hakkindaController = TextEditingController()
      ..text = "${widget.hakkinda}";
    final _fotografController = TextEditingController()
      ..text = "${widget.fotograf}";
    final _adresController = TextEditingController()..text = "${widget.adres}";
    final _telController = TextEditingController()..text = "${widget.tel}";
    final _puanController = TextEditingController()..text = "${widget.puan}";
    final _fiyatController = TextEditingController()..text = "${widget.fiyat}";
    final _olanak1Controller = TextEditingController()
      ..text = "${widget.olanak1}";
    final _olanak2Controller = TextEditingController()
      ..text = "${widget.olanak2}";
    final _olanak3Controller = TextEditingController()
      ..text = "${widget.olanak3}";
    final _olanak4Controller = TextEditingController()
      ..text = "${widget.olanak4}";

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
                      width: 60,
                    ),
                    Text(
                      "Hotel Güncelle",
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
                            "Hotel Adı",
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
                            "Hotel Hakkında",
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
                            "Hotel Fotoğraf",
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
                            "Hotel Adres",
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
                            "Hotel Puan",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _puanController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE7EEF5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Hotel Tel",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Hotel Fiyat",
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
                            "Hotel Olanak 1",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _olanak1Controller,
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
                            "Hotel Olanak 2",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _olanak2Controller,
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
                            "Hotel Olanak 3",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _olanak3Controller,
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
                            "Hotel Olanak 4",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: _olanak4Controller,
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
                            .collection("Hotel")
                            .doc("3_Yıldızlı")
                            .collection("3_Yıldızlı")
                            .doc(widget.docid)
                            .update({
                          "adi": "${_adiController.text}",
                          "hakkinda": "${_hakkindaController.text}",
                          "fotograf": "${_fotografController.text}",
                          "adres": "${_adresController.text}",
                          "puan": "${_puanController.text}",
                          "tel": int.parse(_telController.text),
                          "fiyat": int.parse(_fiyatController.text),
                          "Olanak1": "${_olanak1Controller.text}",
                          "Olanak2": "${_olanak2Controller.text}",
                          "Olanak3": "${_olanak3Controller.text}",
                          "Olanak4": "${_olanak4Controller.text}",
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    admin3yildizlihotelAnkarapage()));
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
