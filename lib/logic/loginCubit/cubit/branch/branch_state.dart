import 'package:equatable/equatable.dart';

enum BranchStatus { initial, loading, loaded, error }

class BranchState extends Equatable {
  BranchState({
    required this.branchstatus,
  });

  final BranchStatus branchstatus;

  @override
  List<Object?> get props => [
        branchstatus,
      ];
}
