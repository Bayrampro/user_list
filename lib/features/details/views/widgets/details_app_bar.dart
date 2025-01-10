import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      title: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.go('/');
        },
      ),
    );
  }
}
