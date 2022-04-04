import 'dart:async';

import 'package:bloc_example/helpers/api_responde.dart';
import 'package:bloc_example/models/post.dart';
import 'package:bloc_example/repository/post_repository.dart';

class PostBloc {

  StreamController<ApiResponse<List<Post>>> statusController = StreamController<ApiResponse<List<Post>>>();

  StreamSink<ApiResponse<List<Post>>> get postListSink
   => statusController.sink;

  Stream<ApiResponse<List<Post>>> get postListStream
    => statusController.stream;

  Stream<List<Post>> get obtenerPosts async* {
    final PostRepository _repository = PostRepository();
    List<Post> posts = [];

    posts = await  _repository.fetchPostsList();

    yield posts;
  }

  PostBloc() { 
    fetchPostList();
  }

  fetchPostList() async {
    postListSink.add(ApiResponse.loading('Obteniendo los Post de todos los Usuarios'));
    
    try {
      final PostRepository _repository = PostRepository();
      List<Post> posts = [];

      posts = await _repository.fetchPostsList();
      postListSink.add(ApiResponse.completed(posts));
    } catch (e) {
      postListSink.add(ApiResponse.error(e.toString()));
    }
  }

  void dispose() {
    statusController.close();
  }  
}