import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/create/create_page.dart';
import 'package:instagram_clone/detail_post/detail_post_page.dart';
import 'package:instagram_clone/domain/post.dart';

import 'search_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  // final List<String> _urls = const [
  //   'https://upload3.inven.co.kr/upload/2022/01/26/bbs/i15452685728.jpg?MW=800',
  //   'https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdCkTE4%2FbtrDmXeVyyK%2FABwX3KLtchLiWH8W2KmIz1%2Fimg.jpg',
  //   'https://dimg.donga.com/wps/SPORTS/IMAGE/2021/09/03/109078961.2.jpg',
  //   'https://i.pinimg.com/550x/58/18/d6/5818d6653465aba044771ad66df3079b.jpg'
  // ];

  @override
  Widget build(BuildContext context) {
    final model = SearchModel();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePage()),
          );
        },
        child: const Icon(Icons.create),
      ),
      appBar: AppBar(
        title: const Text('Instagram Clone'),
      ),
      body: StreamBuilder<QuerySnapshot<Post>>(
          stream: model.postsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('알 수 없는 에러');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            List<Post> posts =
                snapshot.data!.docs.map((post) => post.data()).toList();

            return GridView.builder(
              itemCount: posts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
              ), //열 갯수
              itemBuilder: (BuildContext context, int index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPostPage(post: post)),
                    );
                  },
                  child: Hero(
                    tag: post.id,
                    child: Image.network(
                      post.imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
