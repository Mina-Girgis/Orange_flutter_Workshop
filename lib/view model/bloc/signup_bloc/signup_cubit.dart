import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/model/signup/univerisity_model.dart';
import 'package:odc/services/utils/app_navigation.dart';
import 'package:odc/view%20model/database/network/dio_helper.dart';
import 'package:odc/view/components/core/toastMessage.dart';
import 'package:odc/view/pages/login/login_screen.dart';

import '../../../model/signup/grade_model.dart';
import '../../database/network/end_points.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  List<UniversityModel> universities = [];
  List<GradeModel> grades = [];
  List<DropdownMenuItem>universityDropDownList=[];
  List<DropdownMenuItem>gradeDropDownList=[];

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  String gender = 'm';
  int universityId = 1;
  int gradeId = 1;
  int roleID = 1;

  bool hiddenText1 = false;
  bool hiddenText2 = false;

  int activeTextField = -1;

  void changeActiveTextField(int index){
    activeTextField=index;
    emit(ChangeActiveTextField());
  }

  void changeHiddenText1(){
    hiddenText1=!hiddenText1;
    emit(ChangeHiddenText());
  }

  void changeHiddenText2(){
    hiddenText2=!hiddenText2;
    emit(ChangeHiddenText());
  }



  Future<void> signup(context) async {
    emit(SignupLoadingState());
    Map<String, dynamic> mp = {
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
      'name': nameController.text.toString(),
      'gender': gender,
      'phoneNumber': phoneController.text.toString(),
      'universityId': universityId,
      'roleId': roleID,
      'gradeId': gradeId,
    };
    if(passwordController.text.toString() == confirmPasswordController.text.toString()){

      await DioHelper.postData(url: registerEndPoint, data: mp).then((value) {
        if (value.statusCode == 200) {
          toastMessage('Account added');
          AppNavigator.customNavigator(
              context: context, screen: LoginScreen(), finish: true);
          emit(SignupSuccess());
        }
      }).catchError((error) {
        if (error is DioError) {
          print(error.response);
          toastMessage(error.response!.data['message'].toString());
        }
        emit(SignupFail());
      });
    }else{
      toastMessage('Password is not the same');
    }

  }

  Future<void> getAllUniversities() async {
    universities.clear();
    await DioHelper.getData(url: universityEndPoint).then(
      (value) {
        List<dynamic> data = value.data['data'];
        data.forEach(
          (element) {
            UniversityModel model = UniversityModel.fromJson(element);
            universities.add(model);
            universityDropDownList.add(
              DropdownMenuItem<String>(
                value: model.name,
                child: Text(
                model.name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
        );
        if (universities.length == data.length) {
          emit(GetAllUniSuccess());
        }
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetAllUniFail());
    });
  }

  Future<void> getAllGrades() async {
    grades.clear();
    await DioHelper.getData(url: gradeEndPoint)
        .then((value) {
        List<dynamic> data = value.data['data'];
        data.forEach(
          (element) {
            GradeModel model = GradeModel.fromJson(element);
            grades.add(model);
            gradeDropDownList.add(DropdownMenuItem<String>(
              value: model.grade,
              child: Text(
                model.grade,
                style: TextStyle(fontSize: 20),
              ),
            ),);
          },
        );
        if (grades.length == data.length) {
          print(grades.length);
          emit(GetAllGradesSuccess());
        }
      },
    ).catchError((error) {
      print(error.toString());
      emit(GetAllGradesFail());
    });
  }
}
