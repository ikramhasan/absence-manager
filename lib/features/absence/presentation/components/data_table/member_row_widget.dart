import 'package:absence_manager/features/absence/presentation/components/user_avatar.dart';
import 'package:flutter/material.dart';

/// A widget that displays a row of a member.
class MemberRowWidget extends StatelessWidget {
  /// Creates a [MemberRowWidget].
  ///
  /// The [imageUrl] and [userName] parameters must not be null.
  const MemberRowWidget({
    required this.imageUrl,
    required this.userName,
    super.key,
  });

  /// The URL of the image of the user.
  final String imageUrl;

  /// The name of the user.
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(
          imageUrl: imageUrl,
        ),
        const SizedBox(width: 8),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
