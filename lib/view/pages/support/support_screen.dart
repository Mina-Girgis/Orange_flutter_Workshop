import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odc/services/utils/size_config.dart';
import '../../../constants/constant.dart';
import '../../components/settings/supportTextField.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: ORANGE,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Support",
            style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.defaultSize! * 2,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              supportTextField(hintText: "Name", maxLines: 1, minLines: 1, icon: Icon(
                    FontAwesomeIcons.user,
                    color: Colors.grey,
                  )),
              supportTextField(hintText: "E-Mail", maxLines: 1, minLines: 1, icon: Icon(
                  Icons.email_outlined,
                ),),
              supportTextField(hintText: "What's making you unhappy?", maxLines: 5, minLines: 5),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Submit"),
                            style: ElevatedButton.styleFrom(
                              primary: ORANGE,
                            ),
                        ),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


