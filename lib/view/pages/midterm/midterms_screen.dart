import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/services/utils/size_config.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../constants/constant.dart';
import '../../../view model/bloc/home/bloc/home_cubit.dart';
import '../../components/core/app_bar.dart';
import '../../components/core/lectureItemDesign.dart';
import '../../components/core/loading.dart';


class MidTermsScreen extends StatelessWidget {
  const MidTermsScreen({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: sharedAppBar(title: "Midterms", context: context),
      body: BlocProvider(
        create: (context) => HomeCubit()..getAllLectures()
        ,
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
                    return lectureItemDesign(subject: cubit.lectues!.data![indexx].lectureSubject, startDate: cubit.lectues!.data![indexx].lectureStartTime, endDate: cubit.lectues!.data![indexx].lectureEndTime, date: cubit.lectues!.data![indexx].lectureDate);
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
