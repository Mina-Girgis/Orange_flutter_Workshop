import '../../../constants/constant.dart';
import '../../../services/utils/size_config.dart';
import '../../../view model/bloc/login_bloc/login_cubit.dart';
import 'package:flutter/material.dart';
Widget defaultButton({
  required cubit,
  required state,
  required String text,
  required Color backgroundColor,
  required Color textColor,
  required Function() function,
}) {
  return SizedBox(
    height: 45,
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
              fontSize: SizeConfig.defaultSize! * 1.9),
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
