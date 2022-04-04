

import 'package:bloc_example/helpers/api_base.dart';
import 'package:bloc_example/models/post.dart';


class PostRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Post>> fetchPostsList() async {
    final response = await _helper.get('/posts');

    return postsFromMap(response);
  }
}