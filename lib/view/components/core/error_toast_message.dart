import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void custonToastMessage({required String text , required Color background}){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: background,
      textColor: Colors.white,
      fontSize: 16.0
  );
}