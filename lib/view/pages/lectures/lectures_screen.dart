import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odc/model/home/lecture_model.dart';
import 'package:odc/view%20model/bloc/home/bloc/home_cubit.dart';

import '../../../services/utils/size_config.dart';
import '../../../constants/constant.dart';
import '../../components/core/app_bar.dart';
import '../../components/core/lectureItemDesign.dart';
import '../../components/core/loading.dart';

class LecturesScreen extends StatelessWidget {
  LecturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: sharedAppBar(title: "Lectures", context: context),
      body: BlocProvider(
        create: (context) => HomeCubit()..getAllLectures(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return (cubit.lectues == null)
                ? loading()
                : ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                    color: ORANGE,
                    axisDirection: AxisDirection.down,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: cubit.lectues!.data!.length,
                      separatorBuilder: (context, index) {
                        return SizedBox();
                      },
                      itemBuilder: (context, indexx) {
                        return lectureItemDesign(
                            subject:
                                cubit.lectues!.data![indexx].lectureSubject,
                            startDate:
                                cubit.lectues!.data![indexx].lectureStartTime,
                            endDate:
                                cubit.lectues!.data![indexx].lectureEndTime,
                            date: cubit.lectues!.data![indexx].lectureDate);
                      },
                    ),
                  ),
                );
          },
        ),
      ),
    );
  }
}
