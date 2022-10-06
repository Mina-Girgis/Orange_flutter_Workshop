part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetAllNewsFail extends NewsState {}
class GetAllNewsSuccess extends NewsState {}
class ChangeIndex extends NewsState {}


