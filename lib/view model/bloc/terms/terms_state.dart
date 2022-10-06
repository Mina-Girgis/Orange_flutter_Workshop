part of 'terms_cubit.dart';

@immutable
abstract class TermsState {}

class TermsInitial extends TermsState {}

class GetAllTermsSuccess extends TermsState {}

class GetAllTermsFail extends TermsState {}


