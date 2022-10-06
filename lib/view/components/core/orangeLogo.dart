import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../services/utils/size_config.dart';
Widget orangeLogo(){
  return Center(
    child: RichText(
      text: TextSpan(
        text: 'Orange',
        style: TextStyle(
          color: ORANGE,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.defaultSize!*3,
        ),
        children: <TextSpan>[
          TextSpan(text: ' Digital Center', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
        ],
      ),
    ),
  );
}
