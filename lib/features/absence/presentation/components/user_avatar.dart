import 'package:flutter/material.dart';

/// A widget that displays a user avatar.
class UserAvatar extends StatelessWidget {
  /// User avatar constructor.
  ///
  /// Requires an [imageUrl] string.
  const UserAvatar({required this.imageUrl, super.key});

  /// The URL or path to the user's image.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey[800]!,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
