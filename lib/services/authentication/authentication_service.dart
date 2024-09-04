import 'package:chat_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign In user with their email and password
  Future<UserCredential?> logInWithEmail(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email, password: password,);
      return user;
    } on FirebaseAuthException catch(e) {
      Utils.showSnackBar(e.message);
    }
    return null;
  }

  // Registers new user with their email and password
  Future<UserCredential?> signUpWithEmail(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      Utils.showSnackBar(e.message);
    }
    return null;
  }


  // Sign out the currently logged in user
  Future signOut() async {
    await _auth.signOut();
  }
}