import 'package:flutter/material.dart';
import 'package:go_easy_care/data/model/banner_messages.dart';
import 'package:go_easy_care/presentation/adapter/dashboard_adapter.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/dashboard/dashboard_controller.dart';
import 'package:go_easy_care/utils/Logger.dart';
import '../../data/remote/apis/api_response.dart';
import '../adapter/schedule_adapter.dart';

class DashboardPage extends StatelessWidget {

  DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.getDashboardMessages();
    return Obx(() => getDashboardWidget());
  }




  Widget getDashboardWidget() {


    switch (controller.response.status) {

      case Status.LOADING:
        return CircularProgressIndicator();
      case Status.COMPLETED:
        List<BannerMessages> messages = controller.response.data as List<BannerMessages>;
        return ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return DashboardAdapter(messages[index]);
              // return  ScheduleAdapter();
            },
            itemCount: messages.length);

      case Status.ERROR:
        if(controller.response.message != null) {
          Get.snackbar("Alert", controller.response.message!);
        }
        return Text(controller.response.status.toString());
      default:
        return Text(controller.response.status.toString());
    }


    /*switch (controller.response.status) {
      case Status.COMPLETED:
        List<BannerMessages> messages = controller.response.data as List<BannerMessages>;
        return ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return DashboardAdapter(messages[index]);
              // return  ScheduleAdapter();
            },
            itemCount: messages.length);
      default:
        return Text(controller.response.status.toString());
    }*/
  }


}
