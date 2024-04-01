import 'dart:developer';

import 'package:clean_arc/ui/home/usecase/fetch_post_use_case.dart';
import 'package:get/get.dart';

import '../../../domain/entities/Post.dart';

class HomeController extends GetxController {
  final FetchPostUseCase _fetchPostUseCase;

  HomeController(this._fetchPostUseCase);

  var posts = RxList<Post>([]);

  void fetchPost() async {
    List<Post> postList = await _fetchPostUseCase.execute();
    print("Item list size: ${postList.length}");
    posts.addAll(postList);
  }

  void fetchPostDetails(int postId) async {
    var post = await _fetchPostUseCase.getPostDetails(postId);
    log("Post title : ${post?.title}");
  }
}
