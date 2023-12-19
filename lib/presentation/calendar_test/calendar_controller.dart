import 'package:get/get.dart';
import 'package:go_easy_care/data/model/schedule.dart';

class CalendarController extends GetxController {
  var startDate =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday));

  //final endDate = DateTime.now().subtract(Duration(days: DateTime.now().weekday)).add(Duration(days: 7)).obs;
  var monthName = "".obs;

  var month = DateTime.now().obs;
  var totalDays = 0.obs;

  var scheduleList = Schedule.getScheduleList();

  var monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  CalendarController() {
    print("startDate: " + startDate.toString()+", "+month.value.weekday.toString());
    changeIndex(999);

    month.value = new DateTime(month.value.year, month.value.month);
    totalDays.value = lastDayOfMonth(month.value);
    //  print("endDate: "+endDate.toString());
  }

/*  void setMonthName(DateTime dateTime) {

    var newDateTime = dateTime.add(Duration(days: 4));
    monthName.value = "${monthList[newDateTime.month - 1]} ${newDateTime.year.toString()}";
  }*/

  void changeIndex(int index) {
    var newDateTime = startDate.add(Duration(days: ((index-999)*7)+4));
    monthName.value = "${monthList[newDateTime.month - 1]} ${newDateTime.year.toString()}";
    //startDate.value = startDate.value.add(const Duration(days: 7));
  }

  /*void changeMonth(int index) {

    int monthChange = (index-999) <= -1 ? -1 : 1;

    month.value = new DateTime(month.value.year, month.value.month + monthChange);
    totalDays.value = lastDayOfMonth(month.value);
    monthName.value = "${monthList[month.value.month-1]} ${month.value.year.toString()}";


    print("Month: "+monthName.value+", Week start day: "+month.value.weekday.toString()+", Total days in month: "+totalDays.value.toString()+", day of month: "+month.value.day.toString());

  }*/

  void nextMonth() {
    month.value = new DateTime(month.value.year, month.value.month + 1);
    totalDays.value = lastDayOfMonth(month.value);
    monthName.value = "${monthList[month.value.month-1]} ${month.value.year.toString()}";
    print("Month: "+monthName.value+", Week start day: "+month.value.weekday.toString()+", Total days in month: "+totalDays.value.toString()+", day of month: "+month.value.day.toString());

  }

  void previousMonth() {
    month.value = new DateTime(month.value.year, month.value.month - 1);
    totalDays.value = lastDayOfMonth(month.value);
    monthName.value = "${monthList[month.value.month-1]} ${month.value.year.toString()}";
    print("Month: "+monthName.value+", Week start day: "+month.value.weekday.toString()+", Total days in month: "+totalDays.value.toString()+", day of month: "+month.value.day.toString());
  }

  int lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? new DateTime(month.year, month.month + 1, 1)
        : new DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(new Duration(days: 1)).day;
  }

 /* void backward(int index) {
    var newDateTime = startDate.add(Duration(days: ((index-999)*7)+4));
    monthName.value = "${monthList[newDateTime.month - 1]} ${newDateTime.year.toString()}";
  }*/
/*final _apiResponse = ApiResponse.initial('Empty data').obs;
  final _loginUsecase = LoginUseCase();

  ApiResponse get response {
    return _apiResponse.value;
  }

  Future<void> login(String emailAddress, String password) async {
    _apiResponse.value = ApiResponse.loading('Fetching artist data');
    try {
      User user = await _loginUsecase.perform(emailAddress, password);
      _apiResponse.value = ApiResponse.completed(user);
    } on AppException catch (e) {
      _apiResponse.value = ApiResponse.error(e.getErrorMessage(), e.getTypeOfException());
    }
  }*/


}


/*
import 'package:get/get.dart';
import 'package:go_easy_care/data/model/schedule.dart';

class CalendarController extends GetxController {
  var startDate =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday));

  var monthName = "".obs;

  var month = DateTime.now().obs;


  var scheduleList = Schedule.getScheduleList();

  var monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  CalendarController() {
    print("startDate: " + startDate.toString()+", "+month.value.weekday.toString());
    changeIndex(999);

    month.value = new DateTime(month.value.year, month.value.month);
  }


  void changeIndex(int index) {
    var newDateTime = startDate.add(Duration(days: ((index-999)*7)+4));
    monthName.value = "${monthList[newDateTime.month - 1]} ${newDateTime.year.toString()}";
  }

  void changeMonth(int index) {

    int monthChange = (index-999) <= -1 ? -1 : 1;
    month.value = new DateTime(month.value.year, month.value.month + monthChange);
    monthName.value = "${monthList[month.value.month-1]} ${month.value.year.toString()}";
    print("Month: "+monthName.value+", Week start day: "+month.value.weekday.toString()+", day of month: "+month.value.day.toString());
  }
}

 */
