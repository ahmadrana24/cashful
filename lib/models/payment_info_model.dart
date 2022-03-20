import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/bank_detail_model.dart';
import 'package:flutter_application_1/models/mtn_detail.dart';

class PaymentInfo {
  BankDetail? bankDetail;
  MtnDetail? mtnDetail;
  PaymentInfo({
    this.bankDetail,
    this.mtnDetail,
  });

  Map<String, dynamic> toMap() {
    return {
      'bankDetail': bankDetail?.toMap(),
      'mtnDetail': mtnDetail?.toMap(),
    };
  }

  factory PaymentInfo.fromMap(Map<String, dynamic> map) {
    return PaymentInfo(
      bankDetail: map['bankDetail'] != null
          ? BankDetail.fromMap(map['bankDetail'])
          : null,
      mtnDetail:
          map['mtnDetail'] != null ? MtnDetail.fromMap(map['mtnDetail']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentInfo.fromJson(String source) =>
      PaymentInfo.fromMap(json.decode(source));

  factory PaymentInfo.fromFirebase(DocumentSnapshot<Object?> snapshot) {
    if (snapshot.data() == null) {
      return PaymentInfo();
    }

    var data = snapshot.data() as Map<String, dynamic>;
    return PaymentInfo(
        bankDetail: data['bankDetail'] != null ? BankDetail.fromMap(data['bankDetail']) : null,
        mtnDetail: data['mtnDetail'] != null ? MtnDetail.fromMap(data['mtnDetail']) : null);
  }
}
