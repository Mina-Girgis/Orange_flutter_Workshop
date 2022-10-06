import 'package:flutter/material.dart';

import '../../../services/utils/size_config.dart';

Widget supportTextField({required String hintText,
  required int maxLines,
  required int minLines,
  Icon? icon}) {
  return Padding(
    padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
    child: TextFormField(
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(10),
          )),
    ),
  );
}
