part of 'get_alldesign_cubit.dart';

class GetAlldesignState extends Equatable {
  final List<AllDesignModel> alldesignlist;
  final Map<dynamic, dynamic> designidwithname;
  const GetAlldesignState(
      {required this.designidwithname, required this.alldesignlist});

  @override
  List<Object> get props => [alldesignlist, designidwithname];
}
