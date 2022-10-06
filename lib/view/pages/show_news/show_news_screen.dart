import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odc/services/utils/size_config.dart';
import 'package:odc/view%20model/bloc/news/news_cubit.dart';
import '../../../constants/constant.dart';
import '../../../model/home/news_model.dart';
import '../../components/core/loading.dart';

class ShowNewsScreen extends StatelessWidget {
  ShowNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getAllNews(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: (cubit.news == null)
                    ? loading()
                    : Stack(
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: SizeConfig.screenWidth!,
                                  height: SizeConfig.screenHeight! * 0.34,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                      image: NetworkImage(cubit
                                          .news!.data![cubit.index].imageUrl
                                          .toString()),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.defaultSize! * 0,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.all(SizeConfig.defaultSize! * 1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cubit.news!.data![cubit.index].title
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.defaultSize! * 3,
                                      ),
                                    ),
                                    Text(
                                      cubit.news!.data![cubit.index].date
                                          .toString(),
                                      style: TextStyle(
                                        color: ORANGE,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.defaultSize! * 2,
                                    ),
                                    Center(
                                      child: Container(
                                        child: Text(
                                          cubit.news!.data![cubit.index].body
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.arrowLeft,
                                      color: ORANGE,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
