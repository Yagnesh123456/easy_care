import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/login/login_controller.dart';
import 'package:go_easy_care/presentation/theme/color.dart';
import 'package:go_easy_care/presentation/theme/text_style.dart';
import 'package:go_easy_care/presentation/translations/language_constant.dart';
import 'package:go_easy_care/presentation/widget/circular_progress_helper.dart';
import 'package:go_easy_care/routes/app_routes.dart';

import '../../data/remote/apis/api_response.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  LoginController controller = Get.find();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // appBar: AppBar(
      //   title: Text("Login Page"),
      // ),

      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        // this._context = context;
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Center(
                            child: Container(
                                //width: 200,
                                //height: 105.93,
                                child: Image.asset(isDarkMode
                                    ? 'asset/images/ic_splash_logo_dark.png'
                                    : 'asset/images/ic_splash_logo_light.png') /*SvgPicture.asset(
                                  'asset/images/ic_flutter_logo.svg',
                                  semanticsLabel: 'Acme Logo'),*/
                                ),
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                                // text: 'helping_build_community'.tr,
                                text: LANG_CONST.HELPING_BUILD_COMMUNITY
                                    .toString()
                                    .tr,
                                style: loginLableStyle.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface)),
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 8.0, right: 12.0, bottom: 12.0),
                    child: Column(
                      children: [
                        TextField(
                          // key: textKey,
                          enabled: true,
                          decoration: InputDecoration(
                            hintText: LANG_CONST.EMAIL.toString().tr,
                            hintStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                            labelText: LANG_CONST.EMAIL.toString().tr,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant),
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant)),
                            enabledBorder: loginEnabledBorder,
                            focusedBorder: loginEnabledBorder,
                            disabledBorder: loginEnabledBorder,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            suffixIcon: IconButton(
                              onPressed: () => _emailController.clear(),
                              icon: SvgPicture.asset(
                                'asset/images/ic_clear.svg',
                                semanticsLabel: LANG_CONST.CLEAR.toString().tr,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                            ),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),

                          controller: _emailController,
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextField(
                          // key: textKey,
                          enabled: true,
                          decoration: InputDecoration(
                            hintText: LANG_CONST.PASSWORD.toString().tr,
                            hintStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                            labelText: LANG_CONST.PASSWORD.toString().tr,
                            labelStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                            border: const OutlineInputBorder(),
                            enabledBorder: loginEnabledBorder,
                            focusedBorder: loginEnabledBorder,
                            disabledBorder: loginEnabledBorder,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            suffixIcon: IconButton(
                              onPressed: () => _pwdController.clear(),
                              icon: SvgPicture.asset(
                                'asset/images/ic_clear.svg',
                                semanticsLabel: 'Clear',
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                            ),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                          controller: _pwdController,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await controller.login(
                                _emailController.text, _pwdController.text);
                            switch (controller.response.status) {
                              case Status.INITIAL:
                                break;
                              case Status.LOADING:
                                CircularProgressHelper(context).startLoading();
                                break;
                              case Status.COMPLETED:
                                CircularProgressHelper(context).stopLoading();
                                Get.offNamed((AppRoutes.HOME));
                                break;
                              case Status.ERROR:
                                CircularProgressHelper(context).stopLoading();
                                if(controller.response.message != null) {
                                  Get.snackbar("Alert", controller.response.message!);
                                }
                                break;
                            }
                          },
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.copyWith(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(kColorsPrimary40),
                              ),
                          child: Text(
                            LANG_CONST.LOGIN.toString().tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: kColorsPrimary100),

                            // color: Theme.of(context)
                            //           .colorScheme
                            //           .onPrimary),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        InkWell(
                          onTap: () {
                            //   Get.offNamed((AppRoutes.FORGOT_PASSWORD));

                            Get.toNamed(AppRoutes.FORGOT_PASSWORD);
                          },
                          child: RichText(
                              // key: textKey,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: LANG_CONST.FORGOT_PASSWORD.toString().tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor
                              //textAlign: textAlign!,
                              ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RichText(
                            // key: textKey,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: LANG_CONST.COPYRIGHT_2022_GOEASYCAARE
                                    .toString()
                                    .tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inverseSurface)),
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor
                            //textAlign: textAlign!,
                            ),
                        SizedBox(
                          height: GetPlatform.isIOS ? 12.0 : 8.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.white,
//     appBar: AppBar(
//       title: Text("Login Page"),
//     ),
//     body: SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 60.0),
//             child: Center(
//               child: Container(
//                   width: 200,
//                   height: 150,
//                   /*decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(50.0)),*/
//                   child: Image.asset('asset/images/app_logo.png')),
//             ),
//           ),
//           Padding(
//             //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Email',
//                   hintText: 'Enter valid email id as abc@gmail.com',
//
//                 suffixIcon: IconButton(
//                   onPressed: () => _controller.clear(),
//                   icon: Icon(Icons.clear),
//                 ),
//               ),
//
//
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 left: 15.0, right: 15.0, top: 15, bottom: 0),
//             //padding: EdgeInsets.symmetric(horizontal: 15),
//             child: TextField(
//             controller:_controller,
//               obscureText: true,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Password',
//                   hintText: 'Enter secure password',
//                 suffixIcon: IconButton(
//                   onPressed: () => _controller.clear(),
//                   icon: Icon(Icons.clear),
//                 ),
//               ),
//             ),
//           ),
//           FlatButton(
//             onPressed: (){
//               //TODO FORGOT PASSWORD SCREEN GOES HERE
//             },
//             child: Text(
//               'Forgot Password',
//               style: TextStyle(color: Colors.blue, fontSize: 15),
//             ),
//           ),
//
//           RoundButton(
//             text: 'Login',
//             fontSize: 25,
//             margin: EdgeInsets.only(left: 16.0,right: 16.0),
//             borderRadius: 100,
//             textColor: Colors.white,
//
//           ),
//           // Container(
//           //   height: 50,
//           //   width: 250,
//           //   decoration: BoxDecoration(
//           //       color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//           //   child: FlatButton(
//           //     onPressed: () {
//           //       // Navigator.push(
//           //       //     context, MaterialPageRoute(builder: (_) => HomePage()));
//           //     },
//           //     child: Text(
//           //       'Login',
//           //       style: TextStyle(color: Colors.white, fontSize: 25),
//           //     ),
//           //   ),
//           // ),
//           SizedBox(
//             height: 130,
//           ),
//           RichTextView('Copyright 2022 GoEasyCare')
//         ],
//       ),
//     ),
//   );
// }
}
