import 'package:flutter/material.dart';

import 'widgets.dart';

class AppListView<T> extends StatelessWidget {
  const AppListView({
    super.key,
    this.loading = false,
    required this.list,
    this.emptyListMessage = 'List is empty',
    required this.builder,
    this.separator,
  });

  final bool loading;
  final List<T> list;
  final String emptyListMessage;
  final Widget Function(T) builder;
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    return switch (loading) {
      true => const AppLoadingShimmer(),
      false when (list).isEmpty => Center(
          child: AppText(emptyListMessage),
        ),
      _ => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return builder(list[index]);
          },
          separatorBuilder: (ctx, i) =>
              separator ?? const Spacing.mediumHeight(),
          itemCount: list.length,
        ),
    };
  }
}
