import 'package:flutter/material.dart';

class TextButtonView extends StatelessWidget {
  String? text;
  final VoidCallback? onPress;


  //passing props in react style
  TextButtonView(
      {
      this.text,
      this.onPress,
      });


  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          if(onPress != null){
            onPress!();
          }
        },
        child: RichText(
        text: TextSpan(
            text: text,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        textScaleFactor: MediaQuery.of(context).textScaleFactor
    ));
  }
}
