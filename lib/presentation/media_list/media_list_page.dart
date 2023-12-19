import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/media.dart';
import '../../data/remote/apis/api_response.dart';
import 'media_list_controller.dart';

class MediaListPage extends StatelessWidget {
  MediaListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: Column(
        children: [
          Obx(() => getDataWid()),
          CupertinoButton(
              child: Text("Get Data"),
              onPressed: () {
                controller.getMediaList("1");
              }),
        ],
      ),
    );
  }

  Widget getDataWid() {
    switch (controller.response.status) {
      case Status.COMPLETED:
        return Text(
          "Size: ${(controller.response.data as List<Media>).length}",
          style: TextStyle(color: Colors.blue),
        );
      default:
        return Text(controller.response.status.toString());
    }
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
