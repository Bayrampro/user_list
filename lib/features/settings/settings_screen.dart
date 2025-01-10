import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:user_list/providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                title: Text(
                  "Темная тема",
                  style: theme.textTheme.bodyLarge,
                ),
                value: isDarkMode,
                onChanged: (value) =>
                    ref.read(themeProvider.notifier).changeTheme(value),
                activeColor: theme.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
