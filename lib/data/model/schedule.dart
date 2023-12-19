import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Schedule {
  final bool isShift;
  final bool isCurrentDay;
  final bool isSelected;
  final DateTime dateTime;

  Schedule(this.isShift, this.isCurrentDay, this.isSelected, this.dateTime);
  
  static List<Schedule> getScheduleList() {
    
    List<Schedule> list = List.empty(growable: true);

    var dateTime =
    DateTime.now().subtract(Duration(days: DateTime.now().weekday));

    dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day+1);
    //DateTime dateTime = DateTime.now();
    list.add(Schedule(false, true, false, dateTime));

    dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day+1);
    list.add(Schedule(true, false, false, dateTime));

    dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day+1);
    list.add(Schedule(true, false, false, dateTime));

    dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day+2);
    list.add(Schedule(false, false, true, dateTime));
    
    return list;
  }
}
