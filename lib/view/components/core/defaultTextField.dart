import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odc/view%20model/bloc/login_bloc/login_cubit.dart';
import '../../../constants/constant.dart';

Widget defaultTextField({required Function()onTap,required cubit,required int id,required Function ()function ,bool hidden=false,bool pass=false,required controller , required String hintText, bool sufficIcon = false}) {

  return TextFormField(
    onTap: onTap,
    controller: controller,
    obscureText: (hidden)?!pass:pass,
    decoration: InputDecoration(
        label: Text(hintText),
        labelStyle: TextStyle(
          color: (cubit.activeTextField==id)?ORANGE:Colors.grey,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: (sufficIcon == true)
            ?Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: (hidden)
                  ?InkWell(onTap: function , child: Icon(FontAwesomeIcons.solidEye,color: ORANGE,))
                  :InkWell(onTap: function ,child: Icon(FontAwesomeIcons.eyeSlash,color: ORANGE,)),
            )
            : null,
        contentPadding: EdgeInsets.all(15),
        // hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(15),
        ),
      focusedBorder:OutlineInputBorder(
        borderSide:  BorderSide(color: ORANGE, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
  );
}
