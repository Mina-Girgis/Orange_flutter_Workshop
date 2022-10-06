import 'package:flutter/material.dart';

import '../../../constants/constant.dart';
AppBar settingsAppBar(String title,context){
  return AppBar(
    title: Text(title,style: TextStyle(color: Colors.black),),
    centerTitle: true,
    leading: InkWell(
      onTap: (){
        Navigator.pop(context);
      },
        child: Icon( Icons.arrow_back_ios_outlined,color: ORANGE,)),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}