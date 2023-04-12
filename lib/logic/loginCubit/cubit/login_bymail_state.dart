part of 'login_bymail_cubit.dart';

enum SendingotpStatusformail { initial, loading, loaded, error }

class LoginBymailState extends Equatable {
  final SendingotpStatusformail status;

  const LoginBymailState({required this.status});

  @override
  List get props => [
        status,
      ];
}
