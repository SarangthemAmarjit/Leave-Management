import 'package:equatable/equatable.dart';

enum UpdateBranchStatus { initial, loading, loaded, error }

// enum VerifyStatusformail { initial, loading, loaded, error }

class BranchState extends Equatable {
  final UpdateBranchStatus updatebranchStatus;

  const BranchState({
    required this.updatebranchStatus,
  });

  @override
  List get props => [
        updatebranchStatus,
      ];
}
