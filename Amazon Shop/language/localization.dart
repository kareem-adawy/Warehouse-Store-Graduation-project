import 'package:get/route_manager.dart';
import 'package:mansour_udemy/Amazon%20Shop/Utils/my_string.dart';
import 'ar.dart';
import 'en.dart';
import 'fr.dart';


class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    ene: en,
    ara: ar,
    frf: fr,
  };
}