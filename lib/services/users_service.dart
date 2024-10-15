import 'package:chat_app/features/authentication/models/end_user.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersService {
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  final String currentUserId;

  UsersService(): currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';


  Future<void> addUserToDB(EndUser user, String docId) async {
    try {
      await _firebaseFireStore.collection('users').doc(docId).set(
            user.toJson(),
          );
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  Stream<List<EndUser>> fetchUsers() {
    return _firebaseFireStore.collection('users').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (user) => EndUser.fromJson(
                  user.data(),
                  user.id,
                ),
              ).where((user) => user.id != currentUserId)
              .toList(),
        );
  }
}
