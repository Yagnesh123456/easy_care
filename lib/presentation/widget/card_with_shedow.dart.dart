import 'package:flutter/material.dart';



class CardWithShedow extends StatelessWidget {
  double? width;
  double? height;
  EdgeInsets? margin;
  //EdgeInsets? padding;
  Color? color;
  Color? bgColor;
  Decoration? decoration;
  final VoidCallback? onTap;
  Widget? childWidget;
  double radius;

  //passing props in react style
  CardWithShedow({
    this.width,
    this.height,
    this.margin,
    //this.padding,
    this.color,
    this.bgColor,
    this.decoration,
    this.onTap,
    this.childWidget,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return (InkWell(
      onTap: onTap,
      // child: DecoratedBox(
      //   decoration: const BoxDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.blue,
      //         blurRadius: 8,
      //         spreadRadius: 4,
      //         offset: Offset(0, 10),
      //       ),
      //     ],
      //   ),
      //   child: childWidget,
      // ),
      // child: Container(
      //   margin: margin,
      //   child: PhysicalModel(
      //     color: Colors.white,
      //     elevation: 4,
      //     shadowColor: Colors.black,
      //     borderRadius: BorderRadius.circular(radius),
      //     child:childWidget,
      //
      //   ),
     // ),

      child: Container(
          margin: margin,
          height: height,
          width: width,
        // decoration:  BoxDecoration(
        //   boxShadow: [
        //      BoxShadow(
        //       color: bgColor ?? Colors.black,
        //       blurRadius: 2.0,
        //     ),
        //   ],
        // ),
        child: Card(
            //elevation: 5,
            color: bgColor,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(radius),
            //
            // ),

            child: childWidget),
      ),

    ));
  }
}
