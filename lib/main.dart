import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:odc/services/utils/bloc_observer.dart';
import 'package:odc/src/app_root.dart';
import 'package:odc/view%20model/database/local/cache_helper/cache_helper.dart';
import 'package:odc/view%20model/database/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(AppRoot());
}

