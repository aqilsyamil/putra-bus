import 'package:app/src/common_widgets/empty_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  const ListItemsBuilder({
    super.key,
    required this.data,
    required this.itemBuilder,
    this.showDivider = true,
  });
  final AsyncValue<List<T>> data;
  final ItemWidgetBuilder<T> itemBuilder;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return data.when(
      data: (items) {
        if (items.isNotEmpty) {
          if (showDivider) {
            return ListView.separated(
              itemCount: items.length + 2,
              itemBuilder: (context, index) {
                if (index == 0 || index == items.length + 1) {
                  return const SizedBox.shrink();
                }
                return itemBuilder(context, items[index - 1]);
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          } else {
            return ListView.builder(
              itemCount: items.length + 2,
              itemBuilder: (context, index) {
                if (index == 0 || index == items.length + 1) {
                  return const SizedBox.shrink();
                }
                return itemBuilder(context, items[index - 1]);
              },
            );
          }
        }

        return const EmptyContent();
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) {
        print(_);
        return const EmptyContent(
          title: 'Something went wrong',
          message: 'Can\'t load items right now',
        );
      },
    );
  }
}
