import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleProfile extends StatelessWidget {
  const CircleProfile({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imgUrl,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: CachedNetworkImageProvider(imgUrl),
            ),
            const SizedBox(height: 16),
            Text(
              '$firstName $lastName',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(color: theme.primaryColor),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.primaryColor, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
