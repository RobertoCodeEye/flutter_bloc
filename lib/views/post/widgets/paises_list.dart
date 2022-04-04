import 'package:bloc_example/models/post.dart';
import 'package:flutter/material.dart';

class PostListWidget extends StatelessWidget {
  final List<Post>? postList;
  
  const PostListWidget({Key? key, required this.postList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postList?.length ?? 0,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              postList![index].title
            ),
            subtitle: Text(
              postList![index].body
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Colors.black54,
                width: 1.5
              )
            ),
          ),
        );
      }
    );
  }
}