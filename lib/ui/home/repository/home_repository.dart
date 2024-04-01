import '../../../domain/entities/Post.dart';
import '../../../domain/entities/user.dart';

abstract class HomeRepository{
  Future<Post?> getPostDetails(int postId);
  Future<List<Post>> getPost();
}