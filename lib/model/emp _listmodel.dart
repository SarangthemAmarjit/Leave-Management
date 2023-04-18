// To parse this JSON data, do
//
//     final EmployeeListModel = EmployeeListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<EmployeeListModel> EmployeeListModelFromJson(String str) =>
    List<EmployeeListModel>.from(
        json.decode(str).map((x) => EmployeeListModel.fromJson(x)));

String EmployeeListModelToJson(List<EmployeeListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeListModel {
  EmployeeListModel({
    required this.employeeId,
    required this.employeeName,
    required this.employeeEmpCode,
    required this.employeeDateOfJoining,
    required this.employeePhoto,
    required this.employeePhone,
    required this.employeeEmpStatus,
    required this.employeeCreatedAt,
    required this.employeeUpdatedAt,
    required this.employeeIsActive,
    required this.employeeUserId,
    required this.employeeBranchId,
    required this.employeeDepartmentId,
    required this.employeeDesignationId,
    required this.employeeEmployeeGradeId,
    required this.role,
  });

  final int employeeId;
  final String employeeName;
  final int employeeEmpCode;
  final DateTime employeeDateOfJoining;
  final dynamic employeePhoto;
  final String employeePhone;
  final String employeeEmpStatus;
  final DateTime employeeCreatedAt;
  final dynamic employeeUpdatedAt;
  final String employeeIsActive;
  final int employeeUserId;
  final int employeeBranchId;
  final int employeeDepartmentId;
  final int employeeDesignationId;
  final int employeeEmployeeGradeId;
  final String role;

  factory EmployeeListModel.fromJson(Map<String, dynamic> json) =>
      EmployeeListModel(
        employeeId: json["employee_id"],
        employeeName: json["employee_name"],
        employeeEmpCode: json["employee_emp_code"],
        employeeDateOfJoining: DateTime.parse(json["employee_date_of_joining"]),
        employeePhoto: json["employee_photo"],
        employeePhone: json["employee_phone"],
        employeeEmpStatus: json["employee_emp_status"],
        employeeCreatedAt: DateTime.parse(json["employee_created_at"]),
        employeeUpdatedAt: json["employee_updated_at"],
        employeeIsActive: json["employee_is_active"],
        employeeUserId: json["employee_user_id"],
        employeeBranchId: json["employee_branch_id"],
        employeeDepartmentId: json["employee_department_id"],
        employeeDesignationId: json["employee_designation_id"],
        employeeEmployeeGradeId: json["employee_employee_grade_id"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "employee_name": employeeName,
        "employee_emp_code": employeeEmpCode,
        "employee_date_of_joining": employeeDateOfJoining.toIso8601String(),
        "employee_photo": employeePhoto,
        "employee_phone": employeePhone,
        "employee_emp_status": employeeEmpStatus,
        "employee_created_at": employeeCreatedAt.toIso8601String(),
        "employee_updated_at": employeeUpdatedAt,
        "employee_is_active": employeeIsActive,
        "employee_user_id": employeeUserId,
        "employee_branch_id": employeeBranchId,
        "employee_department_id": employeeDepartmentId,
        "employee_designation_id": employeeDesignationId,
        "employee_employee_grade_id": employeeEmployeeGradeId,
        "role": role,
      };
}
