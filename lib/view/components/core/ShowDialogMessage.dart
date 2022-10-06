
import 'package:flutter/material.dart';
import 'package:odc/services/utils/app_navigation.dart';
import 'package:odc/view%20model/database/local/cache_helper/cache_helper.dart';
import 'package:odc/view/components/core/defaultButton.dart';
import 'package:odc/view/pages/login/login_screen.dart';

import '../../../constants/constant.dart';

Future<dynamic> ShowDialogMessage(cubit,state,String text1, String text2, String text3,String text4 ,context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            text1,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: Text(text2,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                SizedBox(width: 10,),
                Expanded(child: SizedBox(
                  height: 35,
                  child: defaultButton(cubit: cubit, state: state, text: text4, backgroundColor: Colors.white, textColor: ORANGE, function: (){Navigator.pop(context);}))),
                SizedBox(width: 10,),
                Expanded(child: SizedBox(
                  height: 35,
                    child: defaultButton(cubit: cubit, state: state, text: text3, backgroundColor: ORANGE, textColor: Colors.white, function: (){
                      CacheHelper.putData(key: 'token', value: '-1');
                      AppNavigator.customNavigator(context: context, screen: LoginScreen(), finish: true);
                    }))),
                SizedBox(width: 10,),
              ],
            ),
          ],
        );
      });
}
