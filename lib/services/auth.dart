import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<User?> emaililekullaniciolustur(String email, String sifre) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: sifre);
    return userCredentials.user;
  }

  Future<void> cloudkullaniciolustur(String uid, String kullaniciadi,
      String eposta, CollectionReference kullaniciRef) async {
    return await kullaniciRef
        .doc(uid)
        .set({"kullaniciAdi": kullaniciadi, "eposta": eposta});
  }

  Future<User?> emaililekullanicigirisi(String email, String sifre) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: sifre);
    return userCredentials.user;
  }

  Future<void> cikisyap() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStatus() {
    return _firebaseAuth.authStateChanges();
  }
}
