import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/view%20model/bloc/terms/terms_cubit.dart';
import 'package:simple_html_css/simple_html_css.dart';
import '../../components/core/loading.dart';
import '../../components/core/settings_appbar.dart';

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsCubit()..getAllTerms(),
      child: BlocConsumer<TermsCubit, TermsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = TermsCubit.get(context);
          return Scaffold(
            appBar: settingsAppBar("Terms & S Conditions", context),
            body:(cubit.terms==null)
                ?loading():
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: HTML.toTextSpan(context, cubit.terms!.data!.terms.toString()),

                    ),
                  ],
                ),
              ),

          );
        },
      ),
    );
  }
}
