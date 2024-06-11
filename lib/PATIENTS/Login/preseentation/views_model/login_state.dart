part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final Login_model loginModel;

  LoginSuccessState({required this.loginModel});
}

class LoginFauilreState extends LoginState {
  final String error;

  LoginFauilreState({required this.error});
}
