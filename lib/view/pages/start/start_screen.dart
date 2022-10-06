import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:odc/services/utils/size_config.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../constants/constant.dart';
import '../../../view model/bloc/home/bloc/home_cubit.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig.init(context);
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          bottomNavigationBar: Material(
            elevation: 15,
            child: GNav(
              rippleColor: Colors.black,
              hoverColor: Colors.grey[100]!,
              gap: 10,
              activeColor: ORANGE,
              iconSize: 25,
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!*4, vertical: SizeConfig.defaultSize!*2),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  leading: SvgPicture.asset(
                    HOME,
                    color:(cubit.bottomNavBarIndex==0)?ORANGE:Colors.black,
                  ),
                  text: 'Home',
                  icon:  Icons.eleven_mp,
                ),
                GButton(
                  icon: CupertinoIcons.news,
                  text: 'News',
                  iconColor: (cubit.bottomNavBarIndex==1)?ORANGE:Colors.black,
                ),
                GButton(
                  icon: IconData(0xe318, fontFamily: 'MaterialIcons'),
                  text: 'Settings',
                  leading: SvgPicture.asset(SETTINGS,color: (cubit.bottomNavBarIndex==2)?ORANGE:Colors.black,),
                ),
              ],
              selectedIndex: 0,
              onTabChange: (index) {
                cubit.changeBottomNavBarIndex(index: index);
              },
            ),
          ),
          body: cubit.screens[cubit.bottomNavBarIndex],
        );
      },
    ),
);
  }
}
