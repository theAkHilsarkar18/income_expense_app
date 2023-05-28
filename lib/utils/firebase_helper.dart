import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        .then((value) => status = true)
        .catchError((e) => msg = '${e}');
    return status;
  }

  bool checkUser() {
    User? user = firebaseAuth.currentUser;
    return user != null;
  }

  Future<String?> googleSignIn() async {
    String? msg;
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    // create a new credential
    var credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await firebaseAuth.signInWithCredential(credential).then((value) => msg='Success').catchError((e)=> msg='$e');
    return msg;
  }

  void signOut()
  {

  }
}
