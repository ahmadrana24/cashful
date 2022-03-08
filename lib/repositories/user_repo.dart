import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/services/user_service.dart';

class UserRepository {
  UserService _userService;
  UserRepository(this._userService);

  Future<User?> getUser(String uid) async {
    try {
      DocumentSnapshot snapshot = await _userService.getUser(uid);
      if (snapshot.data() == null) {
        return null;
      }
      User user = User.fromFirebase(snapshot);
      print(user);
      return user;
    } catch (e, stk) {
      print(e);
      print(stk);
      return null;
    }
  }

  Future<bool> registerUser(User user) async {
    return await _userService.registerUser(user);
  }
}
