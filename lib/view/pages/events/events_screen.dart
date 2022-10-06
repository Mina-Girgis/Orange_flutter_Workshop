import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../constants/constant.dart';
import '../../../services/utils/size_config.dart';
import '../../../view model/bloc/home/bloc/home_cubit.dart';
import '../../components/core/app_bar.dart';
import '../../components/core/lectureItemDesign.dart';


class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}


class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  DataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(
            Duration(hours: 2)),
        isAllDay: true,
        subject: 'Meeting',
        color: Colors.blue,
        startTimeZone: '',
        endTimeZone: '',
      ),

    );
    return DataSource(appointments);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.grey,
          ),
        ),
        elevation: 0.0,
        title: Text(
          "Midterms",
          style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.defaultSize! * 2,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SfCalendar(
        view:  CalendarView.month,
        initialSelectedDate: DateTime.now(),
        todayHighlightColor: ORANGE,
        dataSource: _getCalendarDataSource(),
      ),
    );
  }

}
