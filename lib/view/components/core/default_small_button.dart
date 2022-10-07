import '../../../constants/constant.dart';
import '../../../services/utils/size_config.dart';
import '../../../view model/bloc/login_bloc/login_cubit.dart';
import 'package:flutter/material.dart';

Widget defaultSmallButton({
  required state,
  required String text,
  required Color backgroundColor,
  required Color textColor,
  required Function() function,
  required double width,
  required double height,
  required double fontSize,
}) {
  return SizedBox(
    height: height,
    child: ElevatedButton(
        onPressed: function,
        child: (state == LoginLoadingState)
            ? SizedBox(
            width: 20, height: 20, child: CircularProgressIndicator())
            : Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(color: ORANGE),
              ),
            ))),
  );
}
