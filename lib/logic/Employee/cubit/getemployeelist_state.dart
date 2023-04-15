part of 'getemployeelist_cubit.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<EmployeeListModel> allemployeelist;

  PostLoadedState({required this.allemployeelist});
}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}
