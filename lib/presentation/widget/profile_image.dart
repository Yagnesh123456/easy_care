import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'image_button.dart';



class ProfileImage extends StatelessWidget {
  final VoidCallback? onPressed;
  double? size;
  double? fontSize;
  Color? fontColor;
  EdgeInsetsGeometry ?padding;
  EdgeInsetsGeometry? margin;
  String? url;
  Color? borderColor;
  Color? backGroundColor;
  String? icon;
  File? image;
  BoxFit? fit;

  bool ?circleShape;
  bool? isFromTable;
  bool? imageWithBackground;

  //passing props in react style
  ProfileImage({
    this.url = "",
    this.image,
    this.circleShape = true,
    this.imageWithBackground = false,
    this.size = 100.0,
    this.fontSize,
    this.fontColor = Colors.red,
    this.padding = const EdgeInsets.all(32.0),
    this.margin,
    this.borderColor = Colors.white,
    this.backGroundColor,
    this.icon = "ic_capture_photo.svg",
    this.fit = BoxFit.cover,
    this.onPressed,
    this.isFromTable = false,
  }){
    fontSize==null?  this.fontSize = 26 :this.fontSize=fontSize;
    backGroundColor==null?  this.backGroundColor = const Color(0xFFB3BFC6) :this.backGroundColor=backGroundColor;
  }

  @override
  Widget build(BuildContext context) {
    if(imageWithBackground != null &&  imageWithBackground!){
      return  InkWell(
        onTap: onPressed,
        child:  Stack(
          children: [
            Container(
              width: size,
              height: size,
              margin: margin,
              alignment: Alignment.center,
              decoration:  BoxDecoration(
                // color: Colors.transparent,
                color: backGroundColor,

                borderRadius:  BorderRadius.all(
                    Radius.circular((circleShape!) ? (size! / 2) : 7.2)),
                border:  Border.all(
                  color: borderColor!,
                  width: 1.0,
                ),
              ),
            ),

            Positioned(
              bottom: size! > 60 ? 10.0 : 4.0,
              left: 4.0,
              right: 4.0,
              child: SvgPicture.asset(
                'asset/images/ic_avatar_placeholder.svg',
                allowDrawingOutsideViewBox: false,
                color: Theme.of(context).colorScheme.primaryContainer,
                height: size!/1.5 ,
                width: size!/1.5,
              ),
            ),
          ],
        ),
      );

    }
    // else if (image != null && image!.path != '' && image!.path.isNotEmpty) {
    //   return  InkWell(
    //     onTap: onPressed,
    //     child:  Container(
    //       width: size,
    //       height: size,
    //       margin: margin,
    //       alignment: Alignment.center,
    //       decoration:  BoxDecoration(
    //        // color: Colors.transparent,
    //         color: backGroundColor,
    //         image:  DecorationImage(
    //           image:  FileImage(File(image!.path)),
    //           fit: fit,
    //         ),
    //         borderRadius:  BorderRadius.all(
    //              Radius.circular((circleShape!) ? (size! / 2) : 7.2)),
    //         border:  Border.all(
    //           color: borderColor!,
    //           width: 1.0,
    //         ),
    //       ),
    //     ),
    //   );
    // }
    else if (url!.isNotEmpty) {
      if (url!.contains("http") || url!.contains("www") || url!.contains(".com")) {
        return  GestureDetector(
            onTap: onPressed,
            child:  Container(
              width: size,
              height: size,
              margin: margin,
              decoration:  BoxDecoration(
              //  color: Colors.transparent,
                color: backGroundColor,
                image:  DecorationImage(
                  image: url!.contains("/storage/")
                      ?  FileImage(File(url!) )  as ImageProvider
                      :  NetworkImage(url!),
                  fit: fit,
                ),
                borderRadius:  BorderRadius.all(
                     Radius.circular((circleShape!) ? (size! / 2) : 7.2)),
                border:  Border.all(
                  color: borderColor!,
                  width: 1.0,
                ),
              ),
            ));
      }
      else {
        return  InkWell(
            onTap: onPressed,
            child:  Container(
              width: size,
              height: size,
              margin: margin,
              decoration:  BoxDecoration(
              //  color: Colors.transparent,
                color: backGroundColor,
                borderRadius:  BorderRadius.all(
                     Radius.circular((circleShape!) ? (size! / 2) : 7.2)),
                border:  Border.all(
                  color: borderColor!,
                  width: 1.0,
                ),
              ),
              child:  Center(
                child:
                // RichTextView(
                //   isFromTable! !=null && isFromTable! ? url! : url![0],
                //   fontSize: fontSize!,
                //   fontWeight: FontWeight.normal,
                //   color: fontColor!,
                //   textAlign: TextAlign.center,
                //   margin: EdgeInsets.all(4.0),
                // ),
                Container(
                  margin: EdgeInsets.all(4.0),
                  child: RichText(text: TextSpan(
                      text: isFromTable! !=null && isFromTable! ? url! : url![0],
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.surface

                      )
                  ),
                      textScaleFactor: MediaQuery.of(context).textScaleFactor
                  ),
                ),


              ),
            ));
      }
    }
    else {
      return  RawMaterialButton(
        child:  ImageButton(
          icon: icon,
          width: size! / 2,
          height: size! / 2,
          margin: EdgeInsets.all(0.0),
        ),
        shape: circleShape! ?  CircleBorder() :  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.2)
        ),
       // shape: circleShape ?  CircleBorder() :  Border(),
        elevation: 1.0,
        fillColor: backGroundColor,
        padding: padding!,
        constraints: BoxConstraints(maxHeight: size!, maxWidth: size!),
        onPressed: onPressed,
      );
    }
  }
}
