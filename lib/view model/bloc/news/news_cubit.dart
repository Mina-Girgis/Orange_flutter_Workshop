import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/home/news_model.dart';
import '../../database/local/cache_helper/cache_helper.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  NewsModel?news;
  int index = 0;

  void changeIndex(int idx){
    index = idx;
    emit(ChangeIndex());
  }
  Future<void>getAllNews()async{
    String token = CacheHelper.getData(key: 'token').toString();
    await DioHelper.getData(url: newsEndPoint,token: token)
        .then((value) {
      news = NewsModel.fromJson(value.data);
      emit(GetAllNewsSuccess());
    })
        .catchError((error){
      print(error.toString());
      emit(GetAllNewsFail());
    });
  }

}
