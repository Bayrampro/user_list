import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      floating: true,
      snap: true,
      expandedHeight: 200.0,
      actions: [
        IconButton(
          onPressed: () => context.go('/settings'),
          icon: const Icon(Icons.settings, size: 35),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'User List',
          style: theme.textTheme.titleLarge?.copyWith(color: theme.canvasColor),
        ),
        background: Image.asset(
          'assets/bg.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
