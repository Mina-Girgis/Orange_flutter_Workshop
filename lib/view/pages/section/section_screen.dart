import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constant.dart';
import '../../../services/utils/size_config.dart';
import '../../../view model/bloc/home/bloc/home_cubit.dart';
import '../../components/core/app_bar.dart';
import '../../components/core/lectureItemDesign.dart';
import '../../components/core/loading.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: sharedAppBar(title: "Sections", context: context),
      body: BlocProvider(
        create: (context) => HomeCubit()..getAllSections()
        ,
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return (cubit.sections == null)
                ? loading()
                :ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                color: ORANGE,
                axisDirection: AxisDirection.down,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: cubit.sections!.data!.length,
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                  itemBuilder: (context, indexx) {
                    return lectureItemDesign(subject: cubit.sections!.data![indexx].sectionSubject, startDate: cubit.sections!.data![indexx].sectionStartTime, endDate: cubit.sections!.data![indexx].sectionEndTime, date: cubit.sections!.data![indexx].sectionDate);

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


