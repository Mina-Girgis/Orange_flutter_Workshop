import 'package:flutter/material.dart';

import '../../../services/utils/size_config.dart';

Widget settingsItem({required String title, required Function() function}) {
  return Padding(
    padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.grey,
        ),
      ],
    ),
  );
}
