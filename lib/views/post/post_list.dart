import 'dart:developer';

import 'package:bloc_example/blocs/posts_bloc.dart';
import 'package:bloc_example/views/post/widgets/paises_list.dart';
import 'package:flutter/material.dart';

import '../../models/post.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final postBloc = PostBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posts de Usuarios'
        ),
        centerTitle: true,
        elevation: 7.0,
      ),
      body: StreamBuilder(
        stream: postBloc.obtenerPosts,
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          log(snapshot.data.toString());
          return PostListWidget(postList: snapshot.data);
        },
      ),
    );
  }
}