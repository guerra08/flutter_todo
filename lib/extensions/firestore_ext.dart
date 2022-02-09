import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreExt on FirebaseFirestore {
  CollectionReference usersListRef(String userUid) =>
      collection('users').doc(userUid).collection('tasks');
}
