import 'dart:developer';

import 'package:clean_arc/data/provider/network/api/home_api.dart';
import 'package:clean_arc/domain/entities/Post.dart';
import 'package:clean_arc/domain/entities/user.dart';
import 'package:clean_arc/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<List<User>> getUsers() async {
    List<User> userList = [];
    var response = HomeApi.fetchUser();
    return userList;
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
