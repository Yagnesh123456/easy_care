import 'package:flutter/material.dart';



class ColorDot extends StatelessWidget {
  double? width;
  double? height;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Color? color;

  Decoration? decoration;
  final VoidCallback? onTap;
 // Widget? childWidget;
 // double radius;

  //passing props in react style
  ColorDot({
    this.width = 14,
    this.height = 14,
    this.margin,
    this.padding,
    this.color = Colors.green,
    this.decoration,
    this.onTap,
   // this.childWidget,
   // this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return (InkWell(
      onTap: onTap,
      child:Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
        ),
      ),

    ));
  }
}
