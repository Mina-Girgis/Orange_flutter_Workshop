import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/view/components/core/app_bar.dart';

import '../../../view model/bloc/news/news_cubit.dart';
import '../../components/core/loading.dart';
import '../../components/news/newsDesgin.dart';

class OurPartners extends StatelessWidget {
  const OurPartners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getAllNews(),
      child: Scaffold(
        appBar: sharedAppBar(action: false,title: 'Our Partners', context: context),
        body: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return(cubit.news==null)?loading(): Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  newsDesign(context: context, model: cubit.news!.data![0])
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
