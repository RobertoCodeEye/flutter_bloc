import 'dart:convert';

List<Post> postsFromJson(String str) {
  return List<Post>.from(
    json.decode(str).map((x) 
      => Post.fromJson(x)
    )
  );
}

List<Post> postsFromMap(List str) {
  return List<Post>.from(
    str.map((x)
      => Post.fromJson(x)
    )
  );
}

class Post {
    final int userId;
    final int id;
    final String title;
    final String body;
    
    Post({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });


    factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}