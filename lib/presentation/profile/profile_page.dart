import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/theme/text_style.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';
import '../translations/language_constant.dart';
import '../widget/profile_image.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({Key? key}) : super(key: key);

  TextEditingController first_controller = new TextEditingController();
  TextEditingController last_controller = new TextEditingController();
  TextEditingController phone_controller = new TextEditingController();
  TextEditingController email_controller = new TextEditingController();
  TextEditingController address1_controller = new TextEditingController();
  TextEditingController address2_controller = new TextEditingController();
  TextEditingController city_controller = new TextEditingController();
  TextEditingController state_controller = new TextEditingController();
  TextEditingController country_controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    first_controller.text =  LANG_CONST.PLACEHOLDER.toString().tr;
    last_controller.text =  LANG_CONST.PLACEHOLDER.toString().tr;
    phone_controller.text =  LANG_CONST.PLACEHOLDER.toString().tr;
    email_controller.text =  LANG_CONST.PLACEHOLDER.toString().tr;
    address1_controller.text =  LANG_CONST.PLACEHOLDER.toString().tr;
    address2_controller.text =  LANG_CONST.PLACEHOLDER.toString().tr;
    city_controller.text =  LANG_CONST.PLACEHOLDER.toString().tr;
    state_controller.text =  LANG_CONST.PLACEHOLDER.toString().tr;
    country_controller.text =  LANG_CONST.PLACEHOLDER.toString().tr;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar:AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left:16.0,right: 20.0,top: 20.0,bottom: 20.0),
            child: SvgPicture.asset(
              'asset/images/ic_close_light.svg',
              allowDrawingOutsideViewBox: false,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        centerTitle: true,
        title:RichText(text: TextSpan(
            text:  LANG_CONST.PROFILE_INFORMATION.toString().tr,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                 color:Theme.of(context).colorScheme.onSurface,
               ),
        ),
            textScaleFactor: MediaQuery.of(context).textScaleFactor
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),

                  ProfileImage(
                    size: 100,
                    fontSize: 24,
                    url: 'T',
                    imageWithBackground: true,
                    backGroundColor:
                    Theme.of(context).colorScheme.primary,
                    borderColor: Theme.of(context).colorScheme.primary,
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),


                  Divider(
                    height: 1.0,
                    color: Theme.of(context).colorScheme.outline,
                    thickness: 1.0,
                  ),

                  const SizedBox(
                    height: 16.0,
                  ),


                  //first and last name
                  Row(
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Expanded(
                        child: TextField(
                          // key: textKey,
                          enabled: false,

                          decoration: InputDecoration(
                            hintText:  LANG_CONST.FIRST.toString().tr,
                            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
                            ),
                            labelText: LANG_CONST.FIRST.toString().tr,
                            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
                            ),
                            border: const OutlineInputBorder(),
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 15),

                            enabledBorder: profileEnabledBorder,
                            focusedBorder: profileEnabledBorder,
                            disabledBorder: profileEnabledBorder,
                          ),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                              //color: Colors.green
                          ),


                          controller: first_controller,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),

                      Expanded(
                        child:   TextField(
                          // key: textKey,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText:  LANG_CONST.LAST.toString().tr,
                            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                            ),
                            labelText:  LANG_CONST.LAST.toString().tr,
                            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                            ),
                            border: const OutlineInputBorder(),
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 15),
                            enabledBorder: profileEnabledBorder,
                            focusedBorder: profileEnabledBorder,
                            disabledBorder: profileEnabledBorder,
                          ),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                          ),
                          controller: last_controller,
                        )
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 16.0,
                  ),

                  //phone no
                  TextField(
                    // key: textKey,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText:  LANG_CONST.PHONE.toString().tr,
                      hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      labelText:  LANG_CONST.PHONE.toString().tr,
                      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15),
                      enabledBorder: profileEnabledBorder,
                      focusedBorder: profileEnabledBorder,
                      disabledBorder: profileEnabledBorder,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                    ),
                    controller: phone_controller,
                  ),

                  const SizedBox(
                    height: 16.0,
                  ),

                  //email
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText:  LANG_CONST.EMAIL.toString().tr,
                      hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      labelText:  LANG_CONST.EMAIL.toString().tr,
                      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15),
                      enabledBorder: profileEnabledBorder,
                      focusedBorder: profileEnabledBorder,
                      disabledBorder: profileEnabledBorder,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                    ),
                    controller: email_controller,
                  ),


                  const SizedBox(
                    height: 16.0,
                  ),

                  //address1
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText:  LANG_CONST.ADDRESS1.toString().tr,
                      hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      labelText:  LANG_CONST.ADDRESS1.toString().tr,
                      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15),

                      enabledBorder: profileEnabledBorder,
                      focusedBorder: profileEnabledBorder,
                      disabledBorder: profileEnabledBorder,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                    ),
                    controller: address1_controller,
                  ),

                  const SizedBox(
                    height: 16.0,
                  ),


                  //address2
                  TextField(
                    // key: textKey,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText:  LANG_CONST.ADDRESS2.toString().tr,
                      hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      labelText:  LANG_CONST.ADDRESS2.toString().tr,
                      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15),

                      enabledBorder: profileEnabledBorder,
                      focusedBorder: profileEnabledBorder,
                      disabledBorder: profileEnabledBorder,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                    ),
                    controller: address2_controller,
                  ),

                  const SizedBox(
                    height: 16.0,
                  ),

                  //city and state
                  Row(
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Expanded(
                        child:
                        TextField(
                          // key: textKey,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText:  LANG_CONST.CITY.toString().tr,
                            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                            ),
                            labelText:  LANG_CONST.CITY.toString().tr,
                            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                            ),
                            border: const OutlineInputBorder(),
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 15),
                            enabledBorder: profileEnabledBorder,
                            focusedBorder: profileEnabledBorder,
                            disabledBorder: profileEnabledBorder,
                          ),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                          ),
                          controller: city_controller,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),

                      Expanded(
                        child:   TextField(
                          // key: textKey,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText:  LANG_CONST.PROVINCE_STATE.toString().tr,
                            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                            ),
                            labelText:  LANG_CONST.PROVINCE_STATE.toString().tr,
                            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                            ),
                            border: const OutlineInputBorder(),
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 15),
                            enabledBorder: profileEnabledBorder,
                            focusedBorder: profileEnabledBorder,
                            disabledBorder: profileEnabledBorder,
                          ),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                          ),
                          controller: state_controller,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 16.0,
                  ),

                  //country
                  TextField(
                    // key: textKey,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText:  LANG_CONST.COUNTRY.toString().tr,
                      hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      labelText:  LANG_CONST.COUNTRY.toString().tr,
                      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.38),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15),
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38)
                    ),
                    controller: country_controller,
                  ),
                  // EditTextFieldNew(
                  //   textHint: 'Enter Your Country Name',
                  //   labelText: 'Country',
                  //   //  padding: EdgeInsets.symmetric(horizontal: 15),
                  //   fontSize: 16,
                  //   textInputType: TextInputType.text,
                  //   paddingText: EdgeInsets.symmetric(horizontal: 15),
                  //   isEnable: false,
                  //  controller: controller,
                  // ),

                  const SizedBox(
                    height: 16.0,
                  ),


                ],
              ),
            ),
          ) ;
        }
      ),
    );
  }
}
