import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/post.dart';

class SearchModel {
  // posts 데이터들이 들어있는 Stream, 전체정보
  final Stream<QuerySnapshot<Post>> postsStream = FirebaseFirestore.instance
      .collection('posts')
      .withConverter<Post>(
        fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
        toFirestore: (post, _) => post.toJson(),
      )
      .snapshots();
}
