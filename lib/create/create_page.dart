import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/create/create_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final model = CreateModel();

  final _titleTextController = TextEditingController();

  File? _image;

  bool isLoading = false;

  @override
  void dispose() {
    _titleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 게시물'),
        actions: [
          IconButton(
            onPressed: () async {
              // 이미지 피커 실행
              if (_image != null && _titleTextController.text.isNotEmpty) {
                setState(() {
                  isLoading = true;
                });

                await model.uploadPost(
                  _titleTextController.text,
                  _image!,
                );

                setState(() {
                  isLoading = false;
                });

                if (mounted) {
                  //비동기 코드를 실행하고 나서 화면이 살아있다면 실행
                  Navigator.pop(context);
                }
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleTextController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: '내용을 입력하세요',
                    fillColor: Colors.white70),
              ),
              const SizedBox(height: 20),
              if (isLoading) const CircularProgressIndicator(),
              ElevatedButton(
                onPressed: () async {
                  _image = await model.getImage();

                  //화면 갱신 - setState는 async랑 같이 사용할 수 없다.
                  setState(() {});
                },
                child: const Text('이미지 선택'),
              ),
              if (_image != null)
                Image.file(
                  _image!,
                  width: 300,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
