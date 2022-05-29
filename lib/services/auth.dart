import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _authIslem = FirebaseAuth.instance;
////giriş yap fonksiyonu
  Future<User?> signIn(String email, String password) async {
      var user = await _authIslem.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user;
    
  }
  //kayıt işlemi

  Future<User?> creatPerson(String adiVeSoyadi, String email, String password,
      String cinsiyet, int kilo, int boy) async {
    var user = await _authIslem.createUserWithEmailAndPassword(
        email: email, password: password);
    Map<String, dynamic> kullaniciData = {
      "adiVeSoyadi": adiVeSoyadi,
      "e-Mail": email,
      "password": password,
      "cinsiyet": cinsiyet,
      "kilo": kilo,
      "boy": boy,
    };
    await _firestore
        .collection("usersCollection")
        .doc(user.user?.uid)
        .set(kullaniciData);
    return user.user;
  }
}
