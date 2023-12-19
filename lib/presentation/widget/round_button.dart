import 'package:flutter/material.dart';



class RoundButton extends StatelessWidget {
  String? text;
  double? width;
  double? height;
 // double? elevation;
  double? fontSize;
  final VoidCallback? onPress;
  Color? bgColor = Colors.white;
  Color? borderColor = Colors.white;
  Color? textColor = Colors.black54;
  double? borderRadius;
  //final EdgeInsets? padding;
  //final EdgeInsets? margin;

  //passing props in react style
  RoundButton(
      {this.width,
      this.height = 54.0,
      this.text,
     // this.elevation = 1.0,
      this.fontSize = 18.0,
      this.onPress,
      this.bgColor = Colors.white,
      this.borderColor = Colors.white,
      this.textColor = Colors.black54,
      this.borderRadius = 8.0,
   //     this.padding,
   //     this.margin,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: width,
      height: height,
      child: (ElevatedButton(
          onPressed: onPress,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      side: BorderSide(color: borderColor!),
                  ),
              ),
              backgroundColor: MaterialStateProperty.all(bgColor)
              //on tap button color effect
              //overlayColor: MaterialStateProperty.all<Color>(Colors.black12)
          ),

          child:  Text(text!,
              style:  TextStyle(
                color: textColor,
                /*  color: (bgColor == Colors.white || bgColor == AppColors.darkGray)
                      ? AppColors.lightBlack
                      : Application.cssButtonCustomerDefaultFont,*/
                  fontSize: fontSize)),
        )),
    );
  }
}
