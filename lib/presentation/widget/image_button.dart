import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageButton extends StatelessWidget {
  double? width;
  double? height;
  EdgeInsets? margin;
  EdgeInsets? padding;
  String? icon;
  Color? color;
  Color? bgColor;
  bool? isPNG;
  Decoration ?decoration;
  final VoidCallback? onTap;

  //passing props in react style
  ImageButton({
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.icon,
    this.color,
    this.bgColor,
    this.isPNG = false,
    this.decoration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ( GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child:  Container(
        margin: margin,
        padding: padding,
        color: bgColor,
        height: height,
        width: width,
        child: isPNG!
            ?  Image.asset(
                "asset/images/" + icon!,
                color: color,
              )
            :  SvgPicture.asset(
                "asset/images/" + icon!,
                allowDrawingOutsideViewBox: false,
                color: color,
              ),
        decoration: decoration,
      ),
    ));
  }
}
