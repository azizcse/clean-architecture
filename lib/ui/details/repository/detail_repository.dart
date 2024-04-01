import '../../../domain/entities/Post.dart';

abstract class DetailRepository {
  Future<Post?> getPostDetails(int postId);
}
