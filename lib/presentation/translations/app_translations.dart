import 'package:go_easy_care/presentation/translations/en_US/en_us_translations.dart';
import 'package:go_easy_care/presentation/translations/hi_IN/hi_in_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>>
  translations =
  {
    'en_US' : enUs,
    'hi_IN' : hiIN,
  };

}