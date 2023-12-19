
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AutoWrapText extends StatelessWidget {

  final String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  String fontFamily;
  bool hasLineThrough;
  bool hasUnderLine;
  int? maxLines;
  TextOverflow? overflow;

  AutoWrapText(this.text,{
    this.color = Colors.white,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = "Gotham-Book",
    this.hasUnderLine = false,
    this.hasLineThrough = false,
    this.maxLines,
    this.overflow
  });

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    return  Text(text,
      overflow: overflow ??  defaultTextStyle.overflow,
      maxLines: maxLines ?? defaultTextStyle.maxLines,
      style:  TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: hasLineThrough
            ? TextDecoration.lineThrough
            : hasUnderLine
            ? TextDecoration.underline
            : TextDecoration.none),);
  }
}
