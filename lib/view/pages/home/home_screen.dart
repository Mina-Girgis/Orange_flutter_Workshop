import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odc/view%20model/bloc/home/bloc/home_cubit.dart';
import 'package:odc/view/pages/show_notes/show_all_notes_screen.dart';
import 'package:odc/view/pages/lectures/lectures_screen.dart';
import 'package:odc/view/pages/midterm/midterms_screen.dart';
import 'package:odc/view/pages/login/login_screen.dart';
import 'package:odc/services/utils/app_navigation.dart';
import 'package:odc/services/utils/size_config.dart';
import '../../../constants/constant.dart';
import '../../components/core/orangeLogo.dart';
import '../events/events_screen.dart';
import '../finals/finals_screen.dart';
import '../section/section_screen.dart';
import 'home_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<HomeItem> items = [
    HomeItem(icon: LECTURES, title: "Lectures"),
    HomeItem(icon: SECTIONS, title: "Sections"),
    HomeItem(icon: MIDTERMS, title: "Midterms"),
    HomeItem(icon: FINALS, title: "Finals"),
    HomeItem(icon: EVENTS, title: "Events"),
    HomeItem(icon: NOTES, title: "Notes"),
  ];

  List<Widget> screens = [
    LecturesScreen(),
    SectionsScreen(),
    MidTermsScreen(),
    FinalScreen(),
    EventsScreen(),
    ShowAllNotesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: orangeLogo(),
        toolbarHeight: 80,
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
          //..getAllLectures()..getAllSections()..getAllFinals()..getAllTerms()..getAllNews()..getAllFAQ()
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return SingleChildScrollView(
              child: Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                  child: RawScrollbar(
                    thumbColor: Colors.red,
                    radius: Radius.circular(16),
                    thickness: 7,
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        color: ORANGE,
                        axisDirection: AxisDirection.down,
                        child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 1.4,
                            shrinkWrap: true,
                            // physics: ScrollPhysics(),
                            children: List.generate(items.length, (index) {
                              return InkWell(
                                onTap: () {
                                  // cubit.changeDataList(index);
                                  print(index);
                                  AppNavigator.customNavigator(
                                      context: context,
                                      screen: screens[index],
                                      finish: false);
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: SizeConfig.defaultSize! * 1,
                                      ),
                                      SvgPicture.asset(
                                        items[index].icon,
                                        height: 50,
                                        color: ORANGE,
                                      ),
                                      Text(
                                        items[index].title,
                                        style: TextStyle(
                                            color: ORANGE,
                                            fontWeight: FontWeight.bold,
                                            fontSize: SizeConfig.defaultSize! * 1.8),
                                      ),
                                      SizedBox(),
                                    ],
                                  ),
                                ),
                              );
                            })),
                      ),
                    )


                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeItem {
  late String title;
  late String icon;

  HomeItem({required this.icon, required this.title});
}
