import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareHelper {
  static void showShareOptions(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder:
            (context) => CupertinoActionSheet(
              title: const Text('Share Post'),
              message: const Text('Choose a share option'),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Implement share logic for Instagram
                  },
                  child: const Text('Share to Instagram'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Implement share logic for Facebook
                  },
                  child: const Text('Share to Facebook'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Implement share logic for Copy Link
                  },
                  child: const Text('Copy Link'),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Share Post',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Share to Instagram'),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Implement share logic for Instagram
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.facebook),
                  title: const Text('Share to Facebook'),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Implement share logic for Facebook
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.link),
                  title: const Text('Copy Link'),
                  onTap: () {
                    Navigator.pop(context);
                    // TODO: Implement share logic for Copy Link
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
