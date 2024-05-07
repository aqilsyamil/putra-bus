import 'package:flutter/material.dart';

class ColumnItems extends StatelessWidget {
  const ColumnItems({super.key, this.gap = 0.0, required this.children});

  final double gap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children
              .expand((item) sync* {
                yield SizedBox(
                  height: gap,
                  width: 0.0,
                );
                yield item;
              })
              .skip(1)
              .toList(),
        ));
  }
}
