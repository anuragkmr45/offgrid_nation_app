// chat_header.dart

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// A header widget for the conversation screen.
// If you prefer a single design, you could unify them into one Container,
// but here we show platform-appropriate bars.
class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String status; // e.g. "Active"
  final VoidCallback onBack;

  const ChatHeader({
    super.key,
    required this.userName,
    required this.status,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      // iOS-style navigation bar
      return CupertinoNavigationBar(
        leading: GestureDetector(
          onTap: onBack,
          child: const Icon(CupertinoIcons.back),
        ),
        middle: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              status,
              style: const TextStyle(
                fontSize: 12,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
      );
    } else {
      // Android-style AppBar
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              status,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      );
    }
  }

  // Required for PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
