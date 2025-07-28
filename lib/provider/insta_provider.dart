import 'package:flutter/material.dart';
import '../model/insta_post.dart';

class InstaProvider extends ChangeNotifier {
  final List<InstaPost> _posts = [
    InstaPost(id: '1', username: 'Leila', imageUrl: 'https://picsum.photos/id/101/500/500'),
    InstaPost(id: '2', username: 'Amine', imageUrl: 'https://picsum.photos/id/102/500/500'),
  ];

  List<InstaPost> get posts => _posts;

  void toggleLike(String postId) {
    final post = _posts.firstWhere((p) => p.id == postId);
    post.isLiked = !post.isLiked;
    notifyListeners();
  }
}
