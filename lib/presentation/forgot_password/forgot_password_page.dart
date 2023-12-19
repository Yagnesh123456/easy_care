import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../theme/color.dart';
import '../theme/text_style.dart';
import '../translations/language_constant.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  ForgotPasswordPage({Key? key}) : super(key: key);

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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Image.asset(isDarkMode
                  ? 'asset/images/ic_splash_logo_dark.png'
                  : 'asset/images/ic_splash_logo_light.png'),
            ),
            RichText(
                text: TextSpan(
                    // text: 'helping_build_community'.tr,
                    text: LANG_CONST.HELPING_BUILD_COMMUNITY.toString().tr,
                    style: loginLableStyle.copyWith(
                        color: Theme.of(context).colorScheme.inverseSurface)),
                textScaleFactor: MediaQuery.of(context).textScaleFactor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Center(
                  child: TextField(
                    // key: textKey,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: LANG_CONST.EMAIL.toString().tr,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      suffixIcon: IconButton(
                        onPressed: () => _emailController.clear(),
                        icon: SvgPicture.asset(
                          'asset/images/ic_clear.svg',
                          semanticsLabel: LANG_CONST.CLEAR.toString().tr,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),

                    controller: _emailController,
                    obscureText: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed((AppRoutes.LOGIN));
                    },
                    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all(kColorsPrimary40),
                    ),
                    child: Text(
                      LANG_CONST.FORGOT_PASSWORD.toString().tr,
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
                  RichText(
                    // key: textKey,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: LANG_CONST.LOGIN.toString().tr,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Theme.of(context).colorScheme.primary),
                      ),
                      textScaleFactor: MediaQuery.of(context).textScaleFactor
                    //textAlign: textAlign!,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    // key: textKey,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          text: LANG_CONST.COPYRIGHT_2022_GOEASYCAARE.toString().tr,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.inverseSurface)),
                      textScaleFactor: MediaQuery.of(context).textScaleFactor
                    //textAlign: textAlign!,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
