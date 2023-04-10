part of 'login_bymail_cubit.dart';

enum Status { initial, loading, loaded, error }

class LoginBymailState extends Equatable {
  final Status status;
  const LoginBymailState({required this.status});

  @override
  List get props => [status];
}
