import 'package:clean_arc/presentation/details/di/post_detail_binding.dart';
import 'package:clean_arc/presentation/details/ui/item_details_page.dart';
import 'package:clean_arc/presentation/home/di/home_binding.dart';
import 'package:clean_arc/presentation/home/ui/home_page.dart';
import 'package:get/get.dart';

class CleanRoute {
  CleanRoute._();

  static const String home = '/home';
  static const String detail = '/detail';
}

class ClearPages {
  ClearPages._();

  static final pages = [
    GetPage(
      name: CleanRoute.home,
      page: () => HomePageNew(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: CleanRoute.detail,
      page: () => ItemDetailPage(),
      binding: PostDetailBinding(),
    )
  ];
}
