part of 'get_branch_cubit.dart';

abstract class GetBranchState {}

class GetBranchLoadingState extends GetBranchState {}

class GetBranchLoadedState extends GetBranchState {
  final List<GetBranchModel> getbranchposts;
  GetBranchLoadedState(this.getbranchposts);
}

class GetBranchErrorState extends GetBranchState {
  final String error;
  GetBranchErrorState(this.error);
}
