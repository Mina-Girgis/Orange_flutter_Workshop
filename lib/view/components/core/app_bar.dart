
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/constant.dart';
import '../../../services/utils/size_config.dart';

AppBar sharedAppBar({bool action = true,required String title ,required context}){
  return AppBar(
    automaticallyImplyLeading: false,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: ORANGE,
      ),
    ),
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontSize: SizeConfig.defaultSize! * 2,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: [
      if(action)
        Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: SvgPicture.asset(FILTER,color: ORANGE,width: 30,height: 30,),
      ),
    ],
  );
}