
import 'package:clean_arc/data/cache/cache_service.dart';
import 'package:get/get.dart';

class DependencyCreator {
  static init() {
    //Put Global dependency
    Get.lazyPut(() => CacheService());
  }
}
