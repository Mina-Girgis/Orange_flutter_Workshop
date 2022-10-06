import 'package:flutter/material.dart';
import 'package:odc/view/pages/start/start_screen.dart';
import 'package:odc/view/pages/login/login_screen.dart';
import 'package:odc/services/utils/app_navigation.dart';
import 'package:odc/services/utils/size_config.dart';

import '../../../constants/constant.dart';
import '../../../view model/database/local/cache_helper/cache_helper.dart';
import '../../components/core/orangeLogo.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin{
  late AnimationController controller;
  void initState() {

    try{
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5),)..addListener(() {
        setState(() {
          Future.delayed(Duration(seconds: 5),(){
            String token = CacheHelper.getData(key: 'token').toString();
            Widget screen = (token=='-1')?LoginScreen():StartScreen();
            AppNavigator.customNavigator(context: context, screen: screen, finish: true);
            // Navigator.of(context,rootNavigator: true).pop();
          });
        });
      });
      controller.repeat(reverse: false);
      super.initState();
    }catch(error){
      print('error');
    }


  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  orangeLogo(),
                  SizedBox(height: SizeConfig.defaultSize!*3,),
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.defaultSize!*2),
                    child: SizedBox(
                      width: SizeConfig.screenWidth!,
                      height: 10,
                      child: LinearProgressIndicator(
                        value: controller.value,
                        color: ORANGE,
                        backgroundColor: Colors.grey[300],
                        semanticsLabel: 'Linear progress indicator',
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
