import 'package:get/get.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/category_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/favorites_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/home_screen.dart';
import 'package:mansour_udemy/Amazon%20Shop/View/Screens/setting_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    Home_Screen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ].obs;

  final title = [
    "WareHouse Shop",
    "Categories",
    "Favorites",
    "Setting",
  ].obs;
}
