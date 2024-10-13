import 'package:chat_app/features/authentication/models/end_user.dart';
import 'package:chat_app/services/users_service.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UsersService _usersService = UsersService();

  // Sign In user with their email and password
  Future<UserCredential?> logInWithEmail(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showSnackBar('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Utils.showSnackBar('Wrong password provided for that user.');
      } else {
        Utils.showSnackBar('Error signing in: ${e.message}');
      }
    }
    return null;
  }

  // Registers new user with their email and password
  Future<UserCredential?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential user =  await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final newUser = EndUser(email: email, id: FirebaseAuth.instance.currentUser!.uid);
      await _usersService.addUserToDB(newUser, FirebaseAuth.instance.currentUser!.uid);
      return user;
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
    return null;
  }

  // Sign out the currently logged in user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> sendVerificationEmail() async {
    Utils.showSnackBar('Email verification has been sent');
    try {
      final user = _auth.currentUser;
      await user!.sendEmailVerification();
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  Future<void> resetPassword(String email) async {
    Utils.showSnackBar('Password reset email sent');
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }
}
