import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/home/faq_model.dart';
import '../../database/local/cache_helper/cache_helper.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());
  static FaqCubit get(context) => BlocProvider.of(context);
  FAQModel?faq;


  void changeIconIndex(int index){
    faq!.data![index].changeShow();
    emit(ChangeIconIndex());
  }

  Future<void>getAllFAQ()async{
    String token = CacheHelper.getData(key: 'token').toString();
    await DioHelper.getData(url: faqEndPoint,token: token)
        .then((value) {
      faq = FAQModel.fromJson(value.data);
      emit(GetAllFAQSuccess());
    })
        .catchError((error){
      print(error.toString());
      emit(GetAllFAQFail());
    });
  }



}
