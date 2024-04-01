

import 'package:clean_arc/domain/remote/Post.dart';

abstract class HomeRepository{
  Future<Post?> getPostDetails(int postId);
  Future<List<Post>> getPost();
}