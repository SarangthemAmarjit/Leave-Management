part of 'get_alldept_cubit.dart';

class GetAlldeptState extends Equatable {
  final List<AllDeptListModel> alldeptlist;
  final Map<dynamic, dynamic> deptidwithname;
  const GetAlldeptState(
      {required this.deptidwithname, required this.alldeptlist});

  @override
  List<Object> get props => [alldeptlist, deptidwithname];
}
