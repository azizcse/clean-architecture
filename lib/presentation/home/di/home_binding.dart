
import 'package:clean_arc/presentation/home/presenter/home_presenter.dart';
import 'package:clean_arc/presentation/home/repository/home_repository_impl.dart';
import 'package:clean_arc/presentation/home/usecase/fetch_post_use_case.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepositoryImpl());
    Get.lazyPut(() => FetchPostUseCase(Get.find<HomeRepositoryImpl>()));
    Get.lazyPut(() => HomePresenter(Get.find()));
  }
}
