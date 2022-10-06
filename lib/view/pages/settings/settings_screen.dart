import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/view%20model/bloc/FAQ/faq_cubit.dart';
import 'package:odc/view/components/core/ShowDialogMessage.dart';
import 'package:odc/view/pages/support/support_screen.dart';
import 'package:odc/services/utils/app_navigation.dart';
import '../../../services/utils/size_config.dart';
import '../../components/settings/components.dart';
import '../../components/settings/settingsItem.dart';
import '../FAQ/faq_screen.dart';
import '../our_partners/out_parteners.dart';
import '../terms_and_conditions/terms_and_conditions.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  List<String> titles = [
    "FAQ",
    "Terms & Conditions",
    "Our Partners",
    "Support",
    "Log out",
  ];

  List<Widget>screens = [
    FAQScreen(),
    TermsAndConditions(),
    OurPartners(),
    SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => FaqCubit(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "Settings",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.defaultSize! * 3,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: BlocConsumer<FaqCubit, FaqState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = FaqCubit.get(context);
              return ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: titles.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if (index == 4) {
                          ShowDialogMessage(
                              cubit,
                              state,
                              'Logout',
                              'Are You Sure',
                              'Sure',
                              'Cancel',
                              context);
                        } else {
                          AppNavigator.customNavigator(context: context,
                              screen: screens[index],
                              finish: false);
                        }
                      },
                      child: settingsItem(
                          title: titles[index], function: () {}));
                },

              );
            },
          ),
        ),
      ),
    );
  }
}
