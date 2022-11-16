import 'package:clean_arc/domain/usecases/fetch_post_use_case.dart';
import 'package:get/get.dart';

import '../../../domain/entities/Post.dart';

class HomeController extends GetxController {
  final FetchPostUseCase _fetchPostUseCase;

  HomeController(this._fetchPostUseCase);

  @override
  void onInit() {
    super.onInit();
  }

  void fetchPost()async{
    List<Post> postList = await _fetchPostUseCase.execute();
    print("Item list size: ${postList.length}");
  }
}
