import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/services/utils/size_config.dart';
import 'package:odc/view%20model/bloc/FAQ/faq_cubit.dart';
import 'package:odc/view/components/core/settings_appbar.dart';
import 'package:odc/view/components/faq_widget/faq_widget.dart';

import '../../components/core/loading.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqCubit()..getAllFAQ(),
      child: BlocConsumer<FaqCubit, FaqState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit =FaqCubit.get(context);
          return Scaffold(
            appBar: settingsAppBar('FAQ', context),
            body: (cubit.faq==null)
                ?loading()
                :Container(
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: cubit.faq!.data!.length,
                separatorBuilder: (context,index){
                  return SizedBox(height: SizeConfig.defaultSize!*2,);
                },
                itemBuilder: (context,index){
                  return faqWidget(context: context,index: index,cubit: cubit,question: cubit.faq!.data![index].question.toString() , answer: cubit.faq!.data![index].answer.toString());
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
