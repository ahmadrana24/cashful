import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/user_model.dart';

abstract class IUserService {
  Future<DocumentSnapshot<Object?>> getUser(String uid);
  Future<bool> registerUser(User user);
}

class UserService implements IUserService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _usersRef;
  UserService() {
    _usersRef = _firestore.collection("users_n");
  }

  @override
  Future<DocumentSnapshot<Object?>> getUser(String uid) async {
    DocumentSnapshot snapshot = await _usersRef.doc(uid).get();
    return snapshot;
  }

  @override
  Future<bool> registerUser(User user) async {
    try {
      await _usersRef.doc(user.id).set(user.toMap());
      return true;
    } catch (error) {
      return false;
    }
  }
}
