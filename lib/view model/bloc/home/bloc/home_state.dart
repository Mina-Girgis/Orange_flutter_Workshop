part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class BottomNavBarIndex extends HomeState {}

class GetAllLecturesSuccess extends HomeState {}

class GetAllLecturesFail extends HomeState {}

class GetAllSectionsSuccess extends HomeState {}

class GetAllSectionsFail extends HomeState {}

class GetAllFinalsSuccess extends HomeState {}

class GetAllFinalsFail extends HomeState {}

class GetAllFAQSuccess extends HomeState {}

class GetAllFAQFail extends HomeState {}

class ChangeDataList extends HomeState {}



class GetAllTermsSuccess extends HomeState {}
class GetAllTermsFail extends HomeState {}



