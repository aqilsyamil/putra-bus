import 'package:app/src/common_widgets/empty_content.dart';
import 'package:app/src/common_widgets/list_items/keep_alive_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  const ListItemsBuilder(
      {super.key,
      required this.data,
      required this.itemBuilder,
      this.gap = 0.0});
  final AsyncValue<List<T>> data;
  final ItemWidgetBuilder<T> itemBuilder;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return data.when(
      data: (items) {
        if (items.isNotEmpty) {
          return ListView.custom(
            childrenDelegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return KeepAliveItem(
                    index: index,
                    lastIndex: items.length - 1,
                    gap: gap,
                    child: itemBuilder(context, items[index]));
              },
              childCount: items.length,
              findChildIndexCallback: (Key key) {
                final ValueKey<T> valueKey = key as ValueKey<T>;
                final T data = valueKey.value;
                final int index = items.indexOf(data);
                if (index >= 0) {
                  return index;
                }
                return null;
              },
            ),
          );
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
