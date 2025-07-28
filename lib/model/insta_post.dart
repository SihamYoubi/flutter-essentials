class InstaPost {
  final String id;
  final String username;
  final String imageUrl;
  bool isLiked;

  InstaPost({
    required this.id,
    required this.username,
    required this.imageUrl,
    this.isLiked = false,
  });

  InstaPost copyWith({bool? isLiked}) {
    return InstaPost(
      id: id,
      username: username,
      imageUrl: imageUrl,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
