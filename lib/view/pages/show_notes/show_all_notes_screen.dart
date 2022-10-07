import 'package:flutter/material.dart';
import 'package:odc/view/pages/add_note/add_note_screen.dart';
import 'package:odc/services/utils/app_navigation.dart';

import '../../../services/utils/size_config.dart';

class ShowAllNotesScreen extends StatelessWidget {
  const ShowAllNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppNavigator.customNavigator(
                context: context, screen: AddNoteScreen(), finish: false);
          },
          backgroundColor: Colors.grey,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.grey,
            ),
          ),
          elevation: 0.0,
          title: Text(
            "Notes",
            style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.defaultSize! * 2,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "There's No Data To Show",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: SizeConfig.defaultSize! * 1.5,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
