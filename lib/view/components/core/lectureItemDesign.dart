import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odc/model/home/lecture_model.dart';
import '../../../constants/constant.dart';
import '../../../services/utils/size_config.dart';


Widget lectureItemDesign({required String? subject , required String? startDate , required String? endDate , required String? date}){
  return Padding(
    padding:  EdgeInsets.all(SizeConfig.defaultSize!*1),
    child: Card(
      elevation: 5,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding:  EdgeInsets.all(SizeConfig.defaultSize!*1.5),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: SizeConfig.screenWidth!/2,
                  child: Text(
                    subject!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.defaultSize!*2,
                    ),
                  ),
                ),
                Spacer(),
                SvgPicture.asset(TIME,color: Colors.black,),
                SizedBox(width: 5,),
                Text("2hrs"),
              ],
            ),
            SizedBox(height: SizeConfig.defaultSize!*2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lecture Day"),
                    SizedBox(height: SizeConfig.defaultSize,),
                    Row(
                      children: [
                        SvgPicture.asset(EVENTS,color: Colors.black,),
                        Text("  "+date!),

                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Start Time"),
                    SizedBox(height: SizeConfig.defaultSize,),
                    Row(
                      children: [
                        SvgPicture.asset(TIME,color: Colors.greenAccent,),
                        // Icon(FontAwesomeIcons.clock),
                        Text(("  "+startDate!)),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("End Time"),
                    SizedBox(height: SizeConfig.defaultSize,),
                    Row(
                      children: [
                        SvgPicture.asset(TIME,color: Colors.red,),
                        Text(("  "+endDate!)),
                      ],
                    ),
                  ],
                ),

              ],
            ),
            // SizedBox(height: SizeConfig.defaultSize!*2,),
          ],
        ),
      ),
    ),
  );
}

