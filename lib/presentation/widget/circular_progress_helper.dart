import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularProgressHelper {
  late BuildContext context;

  CircularProgressHelper(this.context);

  // this is where you would do your fullscreen loading
  Future<void> startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 4.0,
          backgroundColor: Colors.green,
          // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(color: Colors.yellow,),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    //Navigator.of(context).pop();
  }
}
