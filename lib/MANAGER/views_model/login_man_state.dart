part of 'login_man_cubit.dart';

@immutable
abstract class LoginManState {}

class LoginManInitial extends LoginManState {}

class LoginManChangeIconState extends LoginManState {}

class LoginManLoadingState extends LoginManState {}

class LoginManSuccessState extends LoginManState {
  final Login_model loginModel;

  LoginManSuccessState({required this.loginModel});
}

class LoginManFauilreState extends LoginManState {
  final String error;

  LoginManFauilreState({required this.error});
}
