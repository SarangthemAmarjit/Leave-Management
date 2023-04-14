// To parse this JSON data, do
//
//     final getBranchModel = getBranchModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetBranchModel> getBranchModelFromJson(String str) =>
    List<GetBranchModel>.from(
        json.decode(str).map((x) => GetBranchModel.fromJson(x)));

String getBranchModelToJson(List<GetBranchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBranchModel {
  GetBranchModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
  });

  final int id;
  final String name;
  final DateTime createdAt;
  final dynamic updatedAt;
  final String isActive;

  factory GetBranchModel.fromJson(Map<String, dynamic> json) => GetBranchModel(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "is_active": isActive,
      };
}
