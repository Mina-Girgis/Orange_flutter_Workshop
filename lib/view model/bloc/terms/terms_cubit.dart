import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/home/terms_model.dart';
import '../../database/local/cache_helper/cache_helper.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());

  static TermsCubit get(context) => BlocProvider.of(context);

  TermsModel? terms;

  Future<void>getAllTerms()async{
    String token = CacheHelper.getData(key: 'token').toString();
    await DioHelper.getData(url: termsEndPoint,token: token)
        .then((value) {
      terms = TermsModel.fromJson(value.data);
      print(terms!.data!.terms);
      emit(GetAllTermsSuccess());

    })
        .catchError((error){
      print(error.toString());
      emit(GetAllTermsFail());
    });
  }


}
