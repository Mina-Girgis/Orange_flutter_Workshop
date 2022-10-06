import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/services/utils/size_config.dart';
import '../../../constants/constant.dart';

Widget dropDownListDesign({required cubit,required String lable, required String value,
  required List<DropdownMenuItem<dynamic>>items,
  required Function(dynamic value)onChange,
}) {
  return Column(
    children: [
      Text(lable),
      SizedBox(height: 10,),
      Container(
        constraints: BoxConstraints(
          minWidth: 120,
          maxWidth: SizeConfig.screenWidth!,
        ),
        height: 60,
        child: DropdownButtonFormField(
          onTap: (){
            cubit.changeActiveTextField(8);
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder( //<-- SEE HERE
             gapPadding: 0.0,
              borderSide: BorderSide(color: Colors.orange, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,//<-- SEE HERE
              borderSide: BorderSide(color: Colors.orange, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            // filled: true,
            // fillColor: Colors.greenAccent,
          ),
          dropdownColor: Colors.white,
          value: value,
          items: items,
          onChanged: onChange,
        ),
      ),
    ],
  );
}