import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:offgrid_nation_app/core/constants/theme_constants.dart';

class ProfileListItem extends StatelessWidget {
  final String name;
  final String handle;
  final String avatarUrl;
  final VoidCallback onFollow;

  const ProfileListItem({
    super.key,
    required this.name,
    required this.handle,
    required this.avatarUrl,
    required this.onFollow,
  });

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    // EDITED: Platform-specific text style for name.
    final nameStyle =
        isIOS
            ? CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )
            : Theme.of(context).textTheme.headlineSmall;

    // EDITED: Platform-specific text style for handle.
    final handleStyle =
        isIOS
            ? CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
              color: AppColors.textSecondary,
            )
            : Theme.of(context).textTheme.titleSmall;

    // EDITED: Platform-specific follow button.
    final followButton =
        isIOS
            ? CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: AppColors.primary,
              onPressed: onFollow,
              child: const Text('FOLLOW'),
            )
            : ElevatedButton(onPressed: onFollow, child: const Text('FOLLOW'));

    return Container(
      color: AppColors.primary.withOpacity(0.9), // Background with opacity.
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(radius: 24, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: nameStyle),
                const SizedBox(height: 4),
                Text(handle, style: handleStyle),
              ],
            ),
          ),
          followButton,
        ],
      ),
    );
  }
}
