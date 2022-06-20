import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/adminpaneli/adminanasayfa.dart';
import 'package:goturkey/arasecimler/sehirsec.dart';
import 'package:goturkey/istanbul/anasayfaIstanbul.dart';
import 'package:goturkey/services/auth.dart';
import 'package:provider/provider.dart';

class adminLoginpage extends StatefulWidget {
  const adminLoginpage({Key? key}) : super(key: key);

  @override
  State<adminLoginpage> createState() => _adminLoginpageState();
}

class _adminLoginpageState extends State<adminLoginpage> {
  @override
  Widget build(BuildContext context) {
    final _loginFormKey = GlobalKey<FormState>();
    final _kullaniciadiController = TextEditingController();
    final _sifreController = TextEditingController();

    List<dynamic> adminList = [];
    String hatamesaji = "";

    final _database = FirebaseFirestore.instance;

    final CollectionReference adminRef = _database.collection("Admin");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7EEF5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 35),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, right: 10),
                  child: Center(child: Image.asset("assets/images/logo.png")),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 210,
                    left: 25,
                    right: 25,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff4A9CC9),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 35, left: 30, right: 30, bottom: 35),
                      child: Form(
                        key: _loginFormKey,
                        child: Column(
                          children: [
                            Text(
                              "Admin Girişi",
                              style: TextStyle(
                                  color: Color(0xffE7EEF5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              controller: _kullaniciadiController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Lütfen Boş Bırakma Admin";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffE7EEF5),
                                prefixIcon: Icon(Icons.person),
                                hintText: "Kullanıcı adını giriniz",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              controller: _sifreController,
                              validator: (value) {
                                if (value!.runes.length < 6) {
                                  return "Şifreniz en az 6 karakter olmalıdır";
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffE7EEF5),
                                prefixIcon: Icon(Icons.password),
                                hintText: "Şifre Giriniz",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$hatamesaji",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_loginFormKey.currentState!.validate()) {
                                  var adminler = adminRef.get().then((value) =>
                                      value.docs.forEach((element) async {
                                        var veri = await element.data();
                                        adminList.add(veri);
                                      }));
                                  for (var i = 0; i < adminList.length; i++) {
                                    if (adminList[i]["kullaniciAdi"] ==
                                            _kullaniciadiController.text &&
                                        adminList[i]["sifre"] ==
                                            _sifreController.text) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                adminanasayfapage(),
                                          ));
                                    } else {
                                      _showMyDialog();
                                    }
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE7EEF5),
                                onPrimary: Color(0xff4A9CC9),
                                elevation: 20,
                                shadowColor: Color(0xffE7EEF5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 7, bottom: 7, right: 30, left: 30),
                                child: Text(
                                  "Giriş Yap",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
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
          title: const Text('Hata!!!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Lütfen Kullanıcı adını ve şifresini kontrol et'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Anladım'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
