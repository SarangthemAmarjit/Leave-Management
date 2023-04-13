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
}
