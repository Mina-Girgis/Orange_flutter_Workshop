import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/view%20model/database/local/cache_helper/cache_helper.dart';
import 'package:odc/view/components/core/custom_snackbar.dart';
import 'package:odc/view/components/core/toastMessage.dart';

import '../../../model/login/user_model.dart';
import '../../../services/utils/app_navigation.dart';
import '../../../view/pages/start/start_screen.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool hidden = false;


  int activeTextField = -1;

  void changeActiveTextField(int index){
    activeTextField=index;
    emit(ChangeActiveTextField());
  }

  void changeHidden(){
    hidden=!hidden;
    emit(ChangeHidden());
  }

  Future<void> login(context) async {
    emit(LoginLoadingState());
    await DioHelper.postData(
      url: loginEndPoint,
      data: {
        'email': emailController.text.toString(),
        'password': passwordController.text.toString(),
      },
    ).then((value) {
      UserModel user = UserModel.fromJson(value.data);
      debugPrint(value.data['message']);
      debugPrint(user.code);
      debugPrint(user.message);
      debugPrint(user.data.token);
      CacheHelper.putData(key: 'token', value: user.data.token);
      debugPrint(user.data.token);
      emit(LoginSuccess());
      topSnackBarSuccess(text: 'Welcome Back', context: context);
      AppNavigator.customNavigator(context: context, screen: StartScreen(), finish: true);
    }).catchError((error) {
      // print(error.toString());
      topSnackBarError(text: 'Account not Found', context: context);
      emit(LoginFail());
    });
  }
}
