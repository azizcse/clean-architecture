import 'dart:developer';

import 'package:clean_arc/data/provider/network/api/home_api.dart';
import 'package:clean_arc/domain/remote/Post.dart';
import 'package:clean_arc/ui/home/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Post?> getPostDetails(int postId) async {
    var response = await HomeApi.fetchPostDetails(postId).request();
    return Post.fromJson(response);
  }

  @override
  Future<List<Post>> getPost() async {
    List<Post> postList = [];
    var response = await HomeApi.fetchPost().request();
    for (var item in response) {
      var post = Post.fromJson(item);
      postList.add(post);
    }
    return postList;
  }
}
