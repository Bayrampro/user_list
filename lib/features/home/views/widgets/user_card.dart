import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:user_list/providers/theme_provider.dart';

class UserCard extends ConsumerWidget {
  const UserCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.id,
  });

  final String firstName;
  final String lastName;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = ref.watch(themeProvider);
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
            leading: const CircleAvatar(
              radius: 30,
              foregroundImage: AssetImage('assets/avatar.avif'),
            ),
            title: Text(
              '$firstName $lastName',
              style: theme.textTheme.titleMedium,
            ),
            subtitle: Text(
              'Посмотреть',
              style: theme.textTheme.titleSmall,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_circle_right_outlined,
                color: isDarkMode ? theme.canvasColor : theme.primaryColor,
              ),
              onPressed: () => context.go('/details/$id'),
            ),
          ),
        ),
      ),
    );
  }
}
