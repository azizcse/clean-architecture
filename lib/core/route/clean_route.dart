import 'package:clean_arc/ui/controller/home/home_binding.dart';
import 'package:clean_arc/ui/pages/home_page.dart';
import 'package:get/get.dart';

class CleanRoute {
  CleanRoute._();

  static const String home = '/home';
}

class ClearPages {
  ClearPages._();

  static final pages = [
    GetPage(
      name: CleanRoute.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    )
  ];
}
