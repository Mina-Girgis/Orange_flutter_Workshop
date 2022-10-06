import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/model/home/terms_model.dart';
import 'package:odc/view%20model/database/local/cache_helper/cache_helper.dart';
import 'package:odc/view%20model/database/network/dio_helper.dart';
import 'package:odc/view/pages/news/news_screen.dart';
import 'package:odc/view/pages/settings/settings_screen.dart';
import '../../../../model/home/faq_model.dart';
import '../../../../model/home/final_model.dart';
import '../../../../model/home/lecture_model.dart';
import '../../../../model/home/news_model.dart';
import '../../../../model/home/section_model.dart';
import '../../../../view/pages/home/home_screen.dart';
import '../../../database/network/end_points.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  LectureModel? lectues;
  SectionModel?sections;
  FinalModel?finals;


  int bottomNavBarIndex=0;
   List<Widget>screens=[
    HomeScreen(),
    NewsScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBarIndex({required int index,context}){
    bottomNavBarIndex = index;
    getAllLectures();
    emit(BottomNavBarIndex());
  }

  Future<void>getAllLectures()async{
    String token = CacheHelper.getData(key: 'token').toString();
    await DioHelper.getData(url: lectureEndPoint, token: token)
        .then((value) {
        lectues = LectureModel.fromJson(value.data);
        emit(GetAllLecturesSuccess());
    })
        .catchError((error){
          print(error.toString());
          emit(GetAllLecturesFail());
    });
  }

  Future<void>getAllSections()async{
    String token = CacheHelper.getData(key: 'token').toString();
    await DioHelper.getData(url: sectionEndPoint,token: token)
        .then((value) {
      List<dynamic>data = value.data['data'];
      sections = SectionModel.fromJson(value.data);
      emit(GetAllSectionsSuccess());
    })
        .catchError((error){
      print(error.toString());
      emit(GetAllSectionsFail());
    });
  }

  Future<void>getAllFinals()async{
    String token = CacheHelper.getData(key: 'token').toString();
    await DioHelper.getData(url: examsEndPoint,token: token)
        .then((value) {
      finals = FinalModel.fromJson(value.data);
      emit(GetAllFinalsSuccess());
    })
        .catchError((error){
      print(error.toString());
      emit(GetAllFinalsFail());
    });
  }














}
