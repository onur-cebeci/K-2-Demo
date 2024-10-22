import 'package:get/get.dart';
import 'package:k12_demo_proje/screens/details_screens/details_screen.dart';
import 'package:k12_demo_proje/screens/home_screens/home_screen.dart';

class Routes {
  static String home = "/";
  static String detailsScreen = "/detail_screen";

  static String getHomeRoute() => home;
  static String getDetailScreenRoute() => detailsScreen;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(
        name: detailsScreen,
        page: () => DetailsScreen(data: Get.arguments['data'])),
  ];
}
