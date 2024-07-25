import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.imgUrl,
    required this.id,
  });

  final String firstName;
  final String lastName;
  final String imgUrl;
  final int id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: () => context.go('/details/$id'),
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: imgUrl,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 30,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            title: Text(
              '$firstName $lastName',
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: theme.primaryColor),
            ),
            subtitle: Text(
              'Go to details',
              style: theme.textTheme.titleSmall
                  ?.copyWith(color: theme.primaryColor),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_circle_right_outlined,
                color: theme.primaryColor,
              ),
              onPressed: () => context.go('/details/$id'),
            ),
          ),
        ),
      ),
    );
  }
}
