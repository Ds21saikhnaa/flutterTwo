// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

PostsList postsFromJson(String str) => PostsList.fromJson(json.decode(str));

String postsToJson(PostsList data) => json.encode(data.toJson());

class PostsList {
  PostsList({
    required this.success,
    required this.count,
    required this.post,
  });

  bool success;
  int count;
  List<Post> post;

  factory PostsList.fromJson(Map<String, dynamic> json) => PostsList(
        success: json["success"],
        count: json["count"],
        post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "count": count,
        "post": List<dynamic>.from(post.map((x) => x.toJson())),
      };
}

class Post {
  Post({
    required this.id,
    required this.image,
    required this.photoUrl,
    required this.description,
    required this.createUser,
    required this.comments,
    required this.like,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  List<String> image;
  List<String> photoUrl;
  String description;
  CreateUser createUser;
  List<dynamic> comments;
  List<dynamic> like;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        image: List<String>.from(json["image"].map((x) => x)),
        photoUrl: List<String>.from(json["photoUrl"].map((x) => x)),
        description: json["description"],
        createUser: CreateUser.fromJson(json["createUser"]),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        like: List<dynamic>.from(json["like"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": List<dynamic>.from(image.map((x) => x)),
        "photoUrl": List<dynamic>.from(photoUrl.map((x) => x)),
        "description": description,
        "createUser": createUser.toJson(),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "like": List<dynamic>.from(like.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class CreateUser {
  CreateUser({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.followers,
    required this.following,
    required this.posts,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String email;
  String photo;
  int followers;
  int following;
  int posts;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory CreateUser.fromJson(Map<String, dynamic> json) => CreateUser(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        photo: json["photo"],
        followers: json["followers"],
        following: json["following"],
        posts: json["posts"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "photo": photo,
        "followers": followers,
        "following": following,
        "posts": posts,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
