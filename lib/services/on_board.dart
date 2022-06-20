import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goturkey/arasecimler/sehirsec.dart';
import 'package:goturkey/login.dart';

class onBoard extends StatefulWidget {
  const onBoard({Key? key}) : super(key: key);

  @override
  State<onBoard> createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
  final auth = FirebaseAuth.instance;
  bool _isLogged = false;
  @override
  void initState() {
    auth
      ..authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
          _isLogged = false;
        } else {
          print('User is signed in!');
          _isLogged = true;
        }

        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLogged ? sehirsecpage() : loginpage();
  }
}
