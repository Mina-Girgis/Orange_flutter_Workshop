import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/services/utils/app_navigation.dart';
import 'package:odc/view%20model/bloc/signup_bloc/signup_cubit.dart';
import 'package:odc/view/pages/login/login_screen.dart';
import 'package:odc/services/utils/size_config.dart';
import '../../components/core/defaultButton.dart';
import '../../components/core/defaultTextField.dart';
import '../../../constants/constant.dart';
import '../../components/core/orangeLogo.dart';
import '../../components/signup/default_drop_down_list.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  List<DropdownMenuItem> gender = [
    DropdownMenuItem<dynamic>(
      value: "Male",
      child: Text(
        "Male",
        style: TextStyle(fontSize: 20),
      ),
    ),
    DropdownMenuItem<dynamic>(
      value: "Female",
      child: Text(
        "Female",
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];



  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
            child: BlocProvider(
              create: (context) => SignupCubit()
                ..getAllGrades()
                ..getAllUniversities(),
              child: BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = SignupCubit.get(context);
                  return (cubit.universities.isEmpty || cubit.grades.isEmpty)
                      ? Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight,
                          child: Center(child: CircularProgressIndicator()))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            orangeLogo(),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 3,
                            ),
                            Text(
                              "Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.defaultSize! * 2.5,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            defaultTextField(
                                cubit: cubit,
                                onTap: () {
                                  cubit.changeActiveTextField(0);
                                },
                                id: 0,
                                function: () {},
                                controller: cubit.nameController,
                                hintText: "Name"),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            defaultTextField(
                                cubit: cubit,
                                onTap: () {
                                  cubit.changeActiveTextField(1);
                                },
                                id: 1,
                                function: () {},
                                controller: cubit.emailController,
                                hintText: "E-mail"),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            defaultTextField(
                                cubit: cubit,
                                onTap: () {
                                  cubit.changeActiveTextField(2);
                                },
                                id: 2,
                                function: () {
                                  cubit.changeHiddenText1();
                                },
                                pass: true,
                                hidden: cubit.hiddenText1,
                                controller: cubit.passwordController,
                                hintText: "Password",
                                sufficIcon: true),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            defaultTextField(
                                cubit: cubit,
                                onTap: () {
                                  cubit.changeActiveTextField(3);
                                },
                                id: 3,
                                hidden: cubit.hiddenText2,
                                function: () {
                                  cubit.changeHiddenText2();
                                },
                                controller: cubit.confirmPasswordController,
                                pass: true,
                                hintText: "Password",
                                sufficIcon: true),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            defaultTextField(
                                cubit: cubit,
                                onTap: () {
                                  cubit.changeActiveTextField(4);
                                },
                                id: 4,
                                function: () {},
                                controller: cubit.phoneController,
                                hintText: "Phone Number"),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: dropDownListDesign(
                                    cubit: cubit,
                                    lable: "Gender",
                                    value: "Male",
                                    items: gender,
                                    onChange: (value) {
                                      if (value == "Male") {
                                        cubit.gender = 'm';
                                      } else {
                                        cubit.gender = 'f';
                                      }
                                      print(cubit.gender);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: dropDownListDesign(
                                    cubit: cubit,
                                    lable: cubit.universities[0].name,
                                    value: cubit.universities[0].name,
                                    items: cubit.universityDropDownList,
                                    onChange: (value) {
                                      // cubit.universityId = value;
                                      int count = 0;
                                      cubit.universities.forEach((element) {
                                        if (element.name == value.toString()) {
                                          cubit.universityId = count;
                                        }
                                        count++;
                                      });
                                      print(cubit.universityId);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    minWidth: 120,
                                    maxWidth: 200,
                                  ),

                                  child: dropDownListDesign(
                                    cubit: cubit,
                                    lable: cubit.grades[0].grade,
                                    value: cubit.grades[0].grade,
                                    items: cubit.gradeDropDownList,
                                    onChange: (value) {
                                      int count = 0;
                                      cubit.grades.forEach((element) {
                                        if (element.grade == value.toString()) {
                                          cubit.gradeId = count;
                                        }
                                        count++;
                                      });
                                      print(cubit.gradeId);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: defaultButton(
                                    cubit: cubit,
                                    state: state,
                                    text: 'Sign Up',
                                    backgroundColor: ORANGE,
                                    textColor: Colors.white,
                                    function: () async {
                                      cubit.signup(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                )),
                                Text("  OR  "),
                                Expanded(
                                    child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.defaultSize! * 2,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: defaultButton(
                                    cubit: cubit,
                                    state: state,
                                    text: 'Login',
                                    backgroundColor: Colors.white,
                                    textColor: ORANGE,
                                    function: () async {
                                      AppNavigator.customNavigator(
                                          context: context,
                                          screen: LoginScreen(),
                                          finish: true);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
