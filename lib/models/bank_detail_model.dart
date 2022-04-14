import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BankDetail {
  late final String? id;
  late final String hodlerName;
  late final String accountNumber;
  late final String accountType;
  late final String bankName;
  late final String bankCode;
  BankDetail({
    this.id,
    required this.hodlerName,
    required this.accountNumber,
    required this.accountType,
    required this.bankName,
    required this.bankCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hodlerName': hodlerName,
      'accountNumber': accountNumber,
      'accountType': accountType,
      'bankName': bankName,
      'bankCode': bankCode,
    };
  }

  factory BankDetail.fromMap(Map<String, dynamic> map) {
    return BankDetail(
      id: map['id'] ?? '',
      hodlerName: map['hodlerName'] ?? '',
      accountNumber: map['accountNumber'] ?? '',
      accountType: map['accountType'] ?? '',
      bankName: map['bankName'] ?? '',
      bankCode: map['bankCode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BankDetail.fromJson(String source) =>
      BankDetail.fromMap(json.decode(source));

  factory BankDetail.romFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    data['id'] = snapshot.id;
    return BankDetail.fromMap(data);
  }
}
