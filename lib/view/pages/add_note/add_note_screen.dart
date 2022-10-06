import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odc/services/utils/size_config.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon( Icons.arrow_back_ios_outlined,color: Colors.grey, )),
        elevation: 0.0,
        title: Text(
          "Add Note",
          style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.defaultSize! * 2,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          SizeConfig.defaultSize! * 2,
        ),
        child: Column(
          children: [
            defaultAddNoteField(title: "title", maxLines: 1, minLines: 1),
            SizedBox(
              height: SizeConfig.defaultSize! * 2,
            ),
            defaultAddNoteField(title: "Date", maxLines: 1, minLines: 1),
            SizedBox(
              height: SizeConfig.defaultSize! * 2,
            ),
            defaultAddNoteField(title: "Note", maxLines: 5, minLines: 5),
            SizedBox(
              height: SizeConfig.defaultSize! * 2,
            ),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.add,size: 15,color: Colors.black,),
                  Text(
                    " Add",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget defaultAddNoteField({required String title, required int maxLines, required int minLines}) {
  return TextFormField(
    minLines: minLines,
    maxLines: maxLines,
    decoration: InputDecoration(
      labelText: title,
      alignLabelWithHint: true,
      labelStyle: TextStyle(

    ),
      hintText: title,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), bottomRight: Radius.circular(20.0)),
      ),
      focusedBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey, width: 2.0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), bottomRight: Radius.circular(20.0)),
      ),),
    );
}
