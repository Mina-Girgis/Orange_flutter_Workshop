import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:odc/view/components/core/custom_snackbar.dart';
import 'package:odc/view/components/core/error_toast_message.dart';
import 'package:odc/view/components/core/toastMessage.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constants/constant.dart';
import '../../../model/home/news_model.dart';
import '../../../services/utils/size_config.dart';
import '../core/orangeLogo.dart';

Widget newsDesign({required Data model ,required context}) {
  return Material(
    elevation: 10,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        // image: DecorationImage(
        //   image: NetworkImage(model.imageUrl.toString()),
        //   fit: BoxFit.cover
        // ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: SizeConfig.defaultSize!,
              ),
              Text(
                model.title.toString(),
                style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.defaultSize! * 2,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ORANGE,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Share.share(model.linkUrl.toString(),subject: 'Title');
                        },
                          child: Icon(
                        IconData(0xec8b, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                        size: 22,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: VerticalDivider(
                          width: 10,
                          color: Colors.white,
                          thickness: 1,
                          endIndent: 0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            topSnackBarInfo(text: 'Copied', context: context);
                            FlutterClipboard.copy(model.linkUrl.toString()).then((value) => print('copied'));
                          },
                          child: Icon(
                            IconData(0xe190, fontFamily: 'MaterialIcons'),
                            color: Colors.white,
                            size: 22,
                          )),
                      // SvgPicture.asset(HOME),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          orangeLogo(),
          SizedBox(
            height: SizeConfig.defaultSize! * 5,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 30,
            ),
            child: Text(
              "   " + model.body.toString(),
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: SizeConfig.defaultSize! * 1.6,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 1,
          ),
        ],
      ),
    ),
  );
}
