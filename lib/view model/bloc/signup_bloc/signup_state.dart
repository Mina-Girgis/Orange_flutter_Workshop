part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoadingState extends SignupState {}
class SignupSuccess extends SignupState {}
class SignupFail extends SignupState {}

class GetAllUniSuccess extends SignupState {}

class GetAllUniFail extends SignupState {}

class GetAllGradesSuccess extends SignupState {}

class GetAllGradesFail extends SignupState {}

class ChangeHiddenText extends SignupState {}

class ChangeActiveTextField extends SignupState {}







