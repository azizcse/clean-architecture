

import 'package:clean_arc/domain/remote/Post.dart';

abstract class DetailRepository {
  Future<Post?> getPostDetails(int postId);
}
