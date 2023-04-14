// To parse this JSON data, do
//
//     final employeeListModel = employeeListModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeListModel> employeeListModelFromJson(String str) =>
    List<EmployeeListModel>.from(
        json.decode(str).map((x) => EmployeeListModel.fromJson(x)));

String employeeListModelToJson(List<EmployeeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeListModel {
  EmployeeListModel({
    required this.id,
    required this.name,
    required this.empCode,
    required this.dateOfJoining,
    required this.photo,
    required this.phone,
    required this.empStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.userId,
    required this.branchId,
    required this.departmentId,
    required this.designationId,
    required this.employeeGradeId,
    required this.role,
  });

  final int id;
  final String name;
  final int empCode;
  final DateTime dateOfJoining;
  final dynamic photo;
  final String phone;
  final String empStatus;
  final DateTime createdAt;
  final dynamic updatedAt;
  final String isActive;
  final int userId;
  final int branchId;
  final int departmentId;
  final int designationId;
  final int employeeGradeId;
  final String? role;

  factory EmployeeListModel.fromJson(Map<String, dynamic> json) =>
      EmployeeListModel(
        id: json["id"],
        name: json["name"],
        empCode: json["emp_code"],
        dateOfJoining: DateTime.parse(json["date_of_joining"]),
        photo: json["photo"],
        phone: json["phone"],
        empStatus: json["emp_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        isActive: json["is_active"],
        userId: json["user_id"],
        branchId: json["branch_id"],
        departmentId: json["department_id"],
        designationId: json["designation_id"],
        employeeGradeId: json["employee_grade_id"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "emp_code": empCode,
        "date_of_joining": dateOfJoining.toIso8601String(),
        "photo": photo,
        "phone": phone,
        "emp_status": empStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "is_active": isActive,
        "user_id": userId,
        "branch_id": branchId,
        "department_id": departmentId,
        "designation_id": designationId,
        "employee_grade_id": employeeGradeId,
        "role": role,
      };
}
