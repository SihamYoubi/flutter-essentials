import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/insta_provider.dart';

class InstaPage extends StatelessWidget {
  const InstaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<InstaProvider>(context).posts;

    return Scaffold(
      appBar: AppBar(title: const Text(" Mini Instagram")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text(post.username[0].toUpperCase())),
                  title: Text(post.username),
                ),
                Image.network(post.imageUrl),
                Consumer<InstaProvider>(
                  builder: (context, provider, _) => IconButton(
                    icon: Icon(
                      post.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: post.isLiked ? Colors.red : null,
                    ),
                    onPressed: () => provider.toggleLike(post.id),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
