import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_branch_state.dart';

class GetBranchCubit extends Cubit<GetBranchState> {
  GetBranchCubit() : super(GetBranchInitial());
}
