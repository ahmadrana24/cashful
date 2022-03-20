import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class LoanRequest {
  String? id;
  String? userId;
  String loanType;
  String loanAmount;
  String loanDetail;
  String totalRepayable;
  String? loanStatus = "pending";
  String paymentTime;
  String? loanDate;
  LoanRequest({
    this.id,
    this.userId,
    required this.loanType,
    required this.loanAmount,
    required this.loanDetail,
    required this.totalRepayable,
    this.loanStatus,
    required this.paymentTime,
    this.loanDate
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'loanType': loanType,
      'loanAmount': loanAmount,
      'loanDetail': loanDetail,
      'totalRepayable': totalRepayable,
      'loanStatus': loanStatus,
      'paymentTime': paymentTime,
      'laonDate': loanDate,
    };
  }

  factory LoanRequest.fromMap(Map<String, dynamic> map) {
    return LoanRequest(
      id: map['id'],
      userId: map['userId'],
      loanType: map['loanType'] ?? '',
      loanAmount: map['loanAmount'] ?? '',
      loanDetail: map['loanDetail'] ?? '',
      totalRepayable: map['totalRepayable'] ?? '',
      loanStatus: map['loanStatus'],
      paymentTime: map['paymentTime'] ?? '',
      loanDate: map['laonDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoanRequest.fromJson(String source) =>
      LoanRequest.fromMap(json.decode(source));

  factory LoanRequest.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    data['id'] = snapshot.id;
    return LoanRequest.fromMap(data);
  }
}
