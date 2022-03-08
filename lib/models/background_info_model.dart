import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BackgroundInformation {
  String id;
  String creditScoreValue;
  String employmentStatus;
  bool isCreditScorePresent;
  bool isSmallBusinessOwner;
  String businessOffering;
  String lengthOfOperation;
  String sourceOfFinancing;
  String businessExpenceMonthly;
  String businessrevenueMonthly;
  String investmentToDate;
  String savingMonthly;
  String stockvelContribution;
  bool isPartOfStockvel;
  String highestLevelOfEducation;
  BackgroundInformation({
    required this.id,
    required this.creditScoreValue,
    required this.employmentStatus,
    required this.isCreditScorePresent,
    required this.isSmallBusinessOwner,
    required this.businessOffering,
    required this.lengthOfOperation,
    required this.sourceOfFinancing,
    required this.businessExpenceMonthly,
    required this.businessrevenueMonthly,
    required this.investmentToDate,
    required this.savingMonthly,
    required this.stockvelContribution,
    required this.isPartOfStockvel,
    required this.highestLevelOfEducation,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creditScoreValue': creditScoreValue,
      'employmentStatus': employmentStatus,
      'isCreditScorePresent': isCreditScorePresent,
      'isSmallBusinessOwner': isSmallBusinessOwner,
      'businessOffering': businessOffering,
      'lengthOfOperation': lengthOfOperation,
      'sourceOfFinancing': sourceOfFinancing,
      'businessExpenceMonthly': businessExpenceMonthly,
      'businessrevenueMonthly': businessrevenueMonthly,
      'investmentToDate': investmentToDate,
      'savingMonthly': savingMonthly,
      'stockvelContribution': stockvelContribution,
      'isPartOfStockvel': isPartOfStockvel,
      'highestLevelOfEducation': highestLevelOfEducation,
    };
  }

  factory BackgroundInformation.fromMap(Map<String, dynamic> map) {
    return BackgroundInformation(
      id: map['id'] ?? '',
      creditScoreValue: map['creditScoreValue'] ?? '',
      employmentStatus: map['employmentStatus'] ?? '',
      isCreditScorePresent: map['isCreditScorePresent'] ?? false,
      isSmallBusinessOwner: map['isSmallBusinessOwner'] ?? false,
      businessOffering: map['businessOffering'] ?? '',
      lengthOfOperation: map['lengthOfOperation'] ?? '',
      sourceOfFinancing: map['sourceOfFinancing'] ?? '',
      businessExpenceMonthly: map['businessExpenceMonthly'] ?? '',
      businessrevenueMonthly: map['businessrevenueMonthly'] ?? '',
      investmentToDate: map['investmentToDate'] ?? '',
      savingMonthly: map['savingMonthly'] ?? '',
      stockvelContribution: map['stockvelContribution'] ?? '',
      isPartOfStockvel: map['isPartOfStockvel'] ?? false,
      highestLevelOfEducation: map['highestLevelOfEducation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BackgroundInformation.fromJson(String source) =>
      BackgroundInformation.fromMap(json.decode(source));

  factory BackgroundInformation.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    data['id'] = snapshot.id;
    return BackgroundInformation.fromMap(data);
  }
}
