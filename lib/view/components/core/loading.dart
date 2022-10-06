import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/services/utils/size_config.dart';

Widget loading(){
  return Container(
    width: SizeConfig.screenWidth,
    height: SizeConfig.screenHeight,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}