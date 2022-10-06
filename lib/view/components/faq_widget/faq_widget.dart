import 'package:flutter/material.dart';
import 'package:odc/services/utils/size_config.dart';
import 'package:odc/view%20model/bloc/FAQ/faq_cubit.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../constants/constant.dart';

Widget faqWidget({
  required FaqCubit cubit,
  required String question,
  required String answer,
  required int index,
  required context,
}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        AnimatedContainer(
          width: SizeConfig.screenWidth,
          // height: 100,
          decoration: BoxDecoration(
            color: ORANGE,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            border: Border.all(
              width: 1,
              color: ORANGE,
              style: BorderStyle.solid,
            ),
          ),
          duration: Duration(seconds: 3),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: RichText(

                      text: HTML.toTextSpan(context, question,defaultTextStyle: TextStyle(color: Colors.white)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cubit.changeIconIndex(index);
                  },
                  icon: (cubit.faq!.data![index].show == false)
                      ? Icon(
                          Icons.keyboard_arrow_down_outlined,
                        )
                      : Icon(
                          Icons.keyboard_arrow_up_outlined,
                        ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          width: SizeConfig.screenWidth,
          height: (cubit.faq!.data![index].show == true) ? 60 : 0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: RichText(
                text: HTML.toTextSpan(context, answer,defaultTextStyle: TextStyle(color: Colors.white)),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            border: Border.all(
              width: 1,
              color: Colors.transparent,
              style: BorderStyle.solid,
            ),
          ),
          duration: Duration(microseconds: 1000),
          curve: Curves.fastOutSlowIn,
        ),
      ],
    ),
  );
}
