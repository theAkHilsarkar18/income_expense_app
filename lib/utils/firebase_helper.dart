import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseHelper {
  static FirebaseHelper firebaseHelper = FirebaseHelper._();

  FirebaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signUP({required email, required password}) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => print("Login Success !"))
        .catchError((e) => print("Failed : $e"));
  }

  bool status = false;
  String msg = '';
  bool signIn({required email, required password}) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => status=true)
        .catchError((e) => msg = '${e}');
    return status;
  }

  bool checkUser()
  {
    User? user = firebaseAuth.currentUser;
    return user != null;
  }

}
