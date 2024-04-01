import 'package:clean_arc/ui/details/presenter/detail_presenter.dart';
import 'package:clean_arc/ui/details/presenter/detail_repository_impl.dart';
import 'package:clean_arc/ui/details/repository/detail_use_case.dart';
import 'package:get/get.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailRepositoryImpl());
    Get.lazyPut(() => PostDetailUseCase(Get.find()));
    Get.lazyPut(() => DetailPresenter(Get.find()));
  }
}
