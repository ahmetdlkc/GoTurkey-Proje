import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/arasecimler/sehirsec.dart';

import 'package:goturkey/register.dart';
import 'package:goturkey/services/auth.dart';
import 'package:provider/provider.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    final _loginFormKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _sifreController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE7EEF5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, right: 10),
                  child: Center(child: Image.asset("assets/images/logo.png")),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 260,
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
                              "Giriş Yap",
                              style: TextStyle(
                                  color: Color(0xffE7EEF5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            SizedBox(
                              height: 25,
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
                              height: 25,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_loginFormKey.currentState!.validate()) {
                                  final user = await Provider.of<Auth>(context,
                                          listen: false)
                                      .emaililekullanicigirisi(
                                          _emailController.text,
                                          _sifreController.text);
                                  if (!user!.emailVerified) {
                                    await _showMyDialog();
                                    await Provider.of<Auth>(context,
                                            listen: false)
                                        .cikisyap();
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                sehirsecpage()));
                                  }
                                  setState(() {});
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hesabın yok mu? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                registerpage()));
                                  },
                                  child: Text(
                                    "Kaydol",
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
}
