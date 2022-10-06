part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFail extends LoginState {}

class ChangeHidden extends LoginState {}

class ChangeActiveTextField extends LoginState {}
