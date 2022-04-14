import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/models/background_info_model.dart';
import 'package:flutter_application_1/models/bank_detail_model.dart';
import 'package:flutter_application_1/models/documents_model.dart';
import 'package:flutter_application_1/models/level_model.dart';
import 'package:flutter_application_1/models/mtn_detail.dart';

class User {
  late final String firstName;
  late final String lastName;
  late final String id;
  late final String address;
  late final String mobileNumber;
  late final String dob;
  late final String fcmToken;
  late VerificationDocuments? verificationDocuments;
  late BankDetail? bankDetail;
  late MtnDetail? mtnDetail;
  late BackgroundInformation? backgroundInformation;
  late final String? levelId;
  late Level? level;

  User({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.address,
    required this.mobileNumber,
    required this.dob,
    required this.fcmToken,
    this.verificationDocuments,
    this.bankDetail,
    this.mtnDetail,
    this.backgroundInformation,
    this.levelId,
    this.level,
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
      'verificationDocuments': verificationDocuments?.toMap(),
      'bankDetail': bankDetail?.toMap(),
      'mtnDetail': mtnDetail?.toMap(),
      'backgroundInformation': backgroundInformation?.toMap(),
      'levelId': levelId,
      'level': level?.toMap(),
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
      verificationDocuments: map['verificationDocuments'] != null
          ? VerificationDocuments.fromMap(map['verificationDocuments'])
          : null,
      bankDetail: map['bankDetail'] != null
          ? BankDetail.fromMap(map['bankDetail'])
          : null,
      mtnDetail:
          map['mtnDetail'] != null ? MtnDetail.fromMap(map['mtnDetail']) : null,
      backgroundInformation: map['backgroundInformation'] != null
          ? BackgroundInformation.fromMap(map['backgroundInformation'])
          : null,
      levelId: map['levelId'],
      level: map['level'] != null ? Level.fromMap(map['level']) : null,
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
