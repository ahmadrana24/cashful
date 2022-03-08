import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String firstName;
  String lastName;
  String id;
  String address;
  String mobileNumber;
  String dob;
  String fcmToken;
  User({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.address,
    required this.mobileNumber,
    required this.dob,
    required this.fcmToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'id': id,
      'address': address,
      'mobileNumber': mobileNumber,
      'dob': dob,
      'fcmToken': fcmToken,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      id: map['id'] ?? '',
      address: map['address'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      dob: map['dob'] ?? '',
      fcmToken: map['fcmToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  factory User.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    data['id'] = snapshot.id;
    return User.fromMap(data);
  }
}
