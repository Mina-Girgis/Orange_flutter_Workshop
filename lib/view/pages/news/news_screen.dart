import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odc/services/utils/app_navigation.dart';
import 'package:odc/services/utils/size_config.dart';
import 'package:odc/view%20model/bloc/news/news_cubit.dart';
import 'package:odc/view/pages/show_news/show_news_screen.dart';
import '../../../model/home/news_model.dart';
import '../../components/core/orangeLogo.dart';
import '../../components/news/newsDesgin.dart';
import '../login/login_screen.dart';
import '../../../constants/constant.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "News",
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.defaultSize! * 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => NewsCubit()..getAllNews(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return (cubit.news==null)
                ?Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                child: Center(child: CircularProgressIndicator()))
                :Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(SizeConfig.defaultSize! * 3),
                  child: Card(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.white60,
                    elevation: 1.5,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: cubit.news!.data!.length,
                      separatorBuilder: (context, index) {
                        return SizedBox();
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            cubit.changeIndex(index);
                            AppNavigator.customNavigator(context: context, screen: ShowNewsScreen(), finish: false);

                          },
                            child: newsDesign(context: context,model: cubit.news!.data![index]));
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

