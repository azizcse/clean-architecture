import '../entities/Post.dart';
import '../entities/user.dart';

abstract class HomeRepository{
  Future<Post?> getPostDetails(int postId);
  Future<List<Post>> getPost();
}