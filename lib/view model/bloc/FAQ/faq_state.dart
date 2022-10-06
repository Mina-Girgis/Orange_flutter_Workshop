part of 'faq_cubit.dart';

@immutable
abstract class FaqState {}

class FaqInitial extends FaqState {}

class GetAllFAQSuccess extends FaqState {}

class GetAllFAQFail extends FaqState {}

class ChangeIconIndex extends FaqState {}

