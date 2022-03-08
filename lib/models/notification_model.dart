import 'dart:convert';

class Notification {
  String id;
  String status;
  String amount;
  String timestamp;
  Notification({
    required this.id,
    required this.status,
    required this.amount,
    required this.timestamp,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'amount': amount,
      'timestamp': timestamp,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'] ?? '',
      status: map['status'] ?? '',
      amount: map['amount'] ?? '',
      timestamp: map['timestamp'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) => Notification.fromMap(json.decode(source));
  
}
