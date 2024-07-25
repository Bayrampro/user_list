import 'package:flutter/material.dart';

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
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'User List',
          style: theme.textTheme.titleLarge?.copyWith(color: theme.canvasColor),
        ),
        background: Image.asset(
          'bg.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
