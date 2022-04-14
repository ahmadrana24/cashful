import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Level {
  late final String? id;
  late final String name;
  late final num min;
  late final num max;
  late final num interest;
  late final List<String> repayDates;
  Level({
    this.id,
    required this.name,
    required this.min,
    required this.max,
    required this.interest,
    required this.repayDates,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'min': min,
      'max': max,
      'interest': interest,
      'repayDates': repayDates,
    };
  }

  factory Level.fromMap(Map<String, dynamic> map) {
    return Level(
      id: map['id'],
      name: map['name'] ?? '',
      min: map['min'] ?? 0,
      max: map['max'] ?? 0,
      interest: map['interest'] ?? 0,
      repayDates: List<String>.from(map['repayDates']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Level.fromJson(String source) => Level.fromMap(json.decode(source));

  factory Level.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    data['id'] = snapshot.id;
    return Level.fromMap(data);
  }
}
