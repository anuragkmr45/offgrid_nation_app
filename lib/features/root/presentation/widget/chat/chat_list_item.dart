// chat_list_item.dart

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';
// Replace with your actual import for AppColors/AppTheme, if needed.

// A single item in the chat list (recent conversations).
class ChatListItem extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String lastMessage;
  final String timeLabel; // e.g. "2 min ago", "1 day ago"
  final VoidCallback onTap;

  const ChatListItem({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.lastMessage,
    required this.timeLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Determine platform.
    final isIOS = Platform.isIOS;

    // Platform-specific text styles for userName and lastMessage.
    final userNameStyle =
        isIOS
            ? CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )
            : Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold);

    final messageStyle =
        isIOS
            ? CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
              color: Colors.grey[600],
            )
            : Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]);

    final timeStyle =
        isIOS
            ? CupertinoTheme.of(
              context,
            ).textTheme.textStyle.copyWith(fontSize: 12, color: Colors.grey)
            : Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(radius: 24, backgroundImage: NetworkImage(avatarUrl)),
            const SizedBox(width: 12),
            // Name + last message in a column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: userNameStyle),
                  const SizedBox(height: 4),
                  Text(
                    lastMessage,
                    style: messageStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Time label on the right
            Text(timeLabel, style: timeStyle),
          ],
        ),
      ),
    );
  }
}
