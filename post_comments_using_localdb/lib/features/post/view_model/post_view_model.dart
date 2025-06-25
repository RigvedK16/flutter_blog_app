import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:post_comments_using_localdb/features/post/model/create_post_model.dart';
import 'package:post_comments_using_localdb/features/post/model/post_model.dart';
import 'package:post_comments_using_localdb/features/post/service/local_database_service.dart';

class PostViewModel extends ChangeNotifier {
  LocalDatabaseService service = LocalDatabaseService();

  List<PostModel> _posts = [];
  UnmodifiableListView<PostModel> get posts => UnmodifiableListView(_posts);

  late String username;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _query;

  void fetch() async {
    _posts = await service.readAll(_query);
    notifyListeners();
  }

  void search(String query) async {
    _query = query;
    fetch();
  }

  Future<void> createPost({
    required title,
    required description,
    required userId,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final model = CreatePostModel(
        userId: userId,
        title: title,
        description: description,
        createdAt: DateTime.now(),
      );
      final createdPost = await service.createPost(model);
      _posts.add(createdPost);
    } catch (err) {
      print('$err');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updatePost({
    required PostModel post,
    required String title,
    required String description,
  }) async {
    int index = _posts.indexOf(post);
    _isLoading = true;
    notifyListeners();
    final updatedPost = post.copyWith(
      title: title,
      description: description,
      updatedAt: DateTime.now(),
    );
    await service.updateDatabase(updatedPost);
    _isLoading = false;
    // List<PostModel> updatedList = _posts;
    // updatedList[index] = updatedPost;
    // _posts = updatedList;
    _posts[index] = updatedPost;
    notifyListeners();
  }

  Future<void> deletePost(PostModel deletePost) async {
    int index = _posts.indexOf(deletePost);
    await service.databaseDelete(deletePost);
    _posts.removeAt(index);
    notifyListeners();
  }
}
