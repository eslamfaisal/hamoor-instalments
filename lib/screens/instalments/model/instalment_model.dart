import 'package:cloud_firestore/cloud_firestore.dart';

class InstalmentModel {
  final String? id;
  final String? orderId;
  final String? clientId;
  final String? name;
  final double? amount;
  final DateTime? issueDate;
  final DateTime? dueDate;
  bool? isPaid;

  InstalmentModel({
    this.id,
    this.name,
    this.amount,
    this.dueDate,
    this.issueDate,
    this.isPaid,
    this.clientId,
    this.orderId,
  });

  factory InstalmentModel.fromJson(Map<String, dynamic> json) =>
      InstalmentModel(
        id: json["id"],
        name: json["name"],
        amount: json["amount"].toDouble(),
        issueDate: (json["issueDate"] as Timestamp).toDate(),
        dueDate: (json["dueDate"] as Timestamp).toDate(),
        isPaid: json["isPaid"],
        clientId: json["clientId"],
        orderId: json["orderId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "issueDate": issueDate!.toIso8601String(),
        "dueDate": dueDate!.toIso8601String(),
        "isPaid": isPaid,
        "clientId": clientId,
        "orderId": orderId,
      };
}
