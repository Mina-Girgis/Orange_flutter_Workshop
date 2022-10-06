import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:odc/view%20model/database/local/cache_helper/cache_helper.dart';
import '../../../view model/bloc/home/bloc/home_cubit.dart';
import '../constants/constant.dart';
import '../view/pages/login/login_screen.dart';
import '../view/pages/splash/splash_screen.dart';
import '../view/pages/start/start_screen.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
