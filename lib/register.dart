import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/login.dart';
import 'package:goturkey/main.dart';

import 'package:email_validator/email_validator.dart';
import 'package:goturkey/services/auth.dart';
import 'package:provider/provider.dart';

class registerpage extends StatefulWidget {
  const registerpage({Key? key}) : super(key: key);

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> kullaniciList = [];
    final _registerFormKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _sifreController = TextEditingController();
    final _kullaniciadiController = TextEditingController();

    final _database = FirebaseFirestore.instance;

    final CollectionReference kullaniciRef =
        _database.collection("Kullanıcılar");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7EEF5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Center(child: Image.asset("assets/images/logo.png")),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 220,
                    left: 25,
                    right: 25,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff4A9CC9),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 30, right: 30, bottom: 35),
                      child: Form(
                        key: _registerFormKey,
                        child: Column(
                          children: [
                            Text(
                              "Kayıt Ol",
                              style: TextStyle(
                                  color: Color(0xffE7EEF5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _kullaniciadiController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Alan Boş Bırakılamaz";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffE7EEF5),
                                prefixIcon: Icon(Icons.person),
                                hintText: "Kullanıcı Adı giriniz",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (!EmailValidator.validate(value!)) {
                                  return "Lütfen Geçerli bir adres giriniz";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffE7EEF5),
                                prefixIcon: Icon(Icons.email),
                                hintText: "Email giriniz",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
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
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                /* kullaniciRef.get().then((value) {
                                  value.docs.forEach((element) {
                                    var veri =
                                        element.data() as Map<dynamic, dynamic>;
                                    kullaniciList.add(veri);
                                  });
                                });*/
                                if (_registerFormKey.currentState!.validate()) {
                                  /*for (int i = 0;
                                      i < kullaniciList.length;
                                      i++) {
                                    if (kullaniciList[i]["eposta"] ==
                                            _emailController.text ||
                                        kullaniciList[i]["kullaniciAd"]) {
                                      _showHataMyDialog();
                                    }
                                  }*/
                                  final user = await Provider.of<Auth>(context,
                                          listen: false)
                                      .emaililekullaniciolustur(
                                          _emailController.text,
                                          _sifreController.text);
                                  var uid = await user!.uid;
                                  await Provider.of<Auth>(context,
                                          listen: false)
                                      .cloudkullaniciolustur(
                                          uid,
                                          _kullaniciadiController.text,
                                          _emailController.text,
                                          kullaniciRef);
                                  if (!user.emailVerified) {
                                    await user.sendEmailVerification();
                                  }
                                  print(user.emailVerified);

                                  await _showMyDialog();
                                  await Provider.of<Auth>(context,
                                          listen: false)
                                      .cikisyap();
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                girissayfasi()));
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE7EEF5),
                                onPrimary: Color(0xff4A9CC9),
                                elevation: 20, // Elevation
                                shadowColor: Color(0xffE7EEF5), // Shadow Color
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 7, bottom: 7, right: 30, left: 30),
                                child: Text(
                                  "Kayıt Ol",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hesabın var mı? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => loginpage()));
                                  },
                                  child: Text(
                                    "Giriş Yap",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 232, 231, 251),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                )
                              ],
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
          title: const Text('ONAY GEREKİYOR'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Lütfen mailinizi kontrol ediniz.'),
                SizedBox(
                  height: 20,
                ),
                Text('Onay linkine tıklayıp tekrar giriş yapmalısınız'),
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

  Future<void> _showHataMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kullanıcı Bulunuyor'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Aynı Eposta veya Kullanıcı adına sahip kullanıcı mevcut'),
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
