import 'package:bloc_example/blocs/posts_bloc.dart';
import 'package:bloc_example/helpers/api_responde.dart';
import 'package:bloc_example/models/post.dart';
import 'package:bloc_example/views/post/widgets/error.dart';
import 'package:bloc_example/views/post/widgets/loading.dart';
import 'package:bloc_example/views/post/widgets/paises_list.dart';
import 'package:flutter/material.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  PostBloc _bloc = PostBloc();

  @override
  void initState() {
    super.initState();
    _bloc = PostBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7.0,
        title: const Text(
          'Posts de Usuarios'
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchPostList(),
        child: StreamBuilder (
          stream: _bloc.postListStream,
          builder: (BuildContext context, AsyncSnapshot<ApiResponse<List<Post>>> snapshot) {
            if ( snapshot.hasData ) {
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data!.message);
                case Status.COMPLETED:
                  return PostListWidget(postList: snapshot.data!.data);
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data!.message,
                    onPressed: () => _bloc.fetchPostList()
                  );
              }
            }
            return const Center(
              child: Text('No Data'),
            );
          },
        ),
      ),
    );
  }
}