import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String userName;
  final String userAvatarUrl;
  final String timeText;
  final String postImageUrl;
  final String description;
  final VoidCallback onThunderPressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;

  const PostWidget({
    super.key,
    required this.userName,
    required this.userAvatarUrl,
    required this.timeText,
    required this.postImageUrl,
    required this.description,
    required this.onThunderPressed,
    required this.onCommentPressed,
    required this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? _buildCupertinoPost(context)
        : _buildMaterialPost(context);
  }

  Widget _buildMaterialPost(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Avatar, Name, and Time
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(userAvatarUrl),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      timeText,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Post Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                postImageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            // Action Row: Thunder, Comment, Share
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.bolt),
                  onPressed: onThunderPressed,
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: onCommentPressed,
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: onSharePressed,
                ),
              ],
            ),
            // Post Description
            Text(description, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildCupertinoPost(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: CupertinoColors.systemGrey4,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Avatar, Name, and Time
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(userAvatarUrl),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      timeText,
                      style: const TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Post Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                postImageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            // Action Row: Thunder, Comment, Share
            Row(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: onThunderPressed,
                  child: const Icon(CupertinoIcons.bolt),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: onCommentPressed,
                  child: const Icon(CupertinoIcons.chat_bubble),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: onSharePressed,
                  child: const Icon(CupertinoIcons.share),
                ),
              ],
            ),
            // Post Description
            Text(description, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
