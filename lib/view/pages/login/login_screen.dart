import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/services/utils/app_navigation.dart';
import 'package:odc/services/utils/size_config.dart';
import 'package:odc/view%20model/bloc/login_bloc/login_cubit.dart';
import 'package:odc/view/pages/signup/sign_up_screen.dart';
import 'package:odc/view/pages/start/start_screen.dart';

import '../../components/core/defaultButton.dart';
import '../../components/core/defaultTextField.dart';
import '../../../constants/constant.dart';
import '../../components/core/orangeLogo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
          child: Container(
            width: SizeConfig.screenWidth,
            // height: SizeConfig.screenHeight,
            child: BlocProvider(
              create: (context) => LoginCubit(),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = LoginCubit.get(context);
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.defaultSize! * 2,
                        ),
                        orangeLogo(),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 9,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize! * 3,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 2,
                        ),
                        defaultTextField(
                            cubit: cubit,
                            onTap: () {
                              cubit.changeActiveTextField(5);
                            },
                            id: 5,
                            controller: cubit.emailController,
                            hintText: "E-mail",
                            function: () {}),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 2,
                        ),
                        defaultTextField(
                            cubit: cubit,
                            onTap: () {
                              cubit.changeActiveTextField(6);
                            },
                            id: 6,
                            pass: true,
                            controller: cubit.passwordController,
                            hintText: "Password",
                            sufficIcon: true,
                            hidden: cubit.hidden,
                            function: () {
                              // print(-1);
                              cubit.changeHidden();
                            }),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 2,
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ORANGE,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 6,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultButton(
                                cubit: cubit,
                                state: state,
                                text: 'Login',
                                backgroundColor: ORANGE,
                                textColor: Colors.white,
                                function: () async {
                                  await cubit.login(context).then((value) {});
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
                                text: 'Sign Up',
                                backgroundColor: Colors.white,
                                textColor: ORANGE,
                                function: () async {
                                  cubit.changeActiveTextField(8);
                                  AppNavigator.customNavigator(
                                      context: context,
                                      screen: SignupScreen(),
                                      finish: true);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
