class Post {
  String id;
  String userId;
  String title;
  String imgUrl;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.imgUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'imgUrl': imgUrl,
    };
  }
}
