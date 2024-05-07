import 'package:flutter/material.dart';

class RowItems extends StatelessWidget {
  const RowItems({super.key, this.gap = 0.0, required this.children});

  final double gap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 0),
        child: Row(
          children: children
              .expand((item) sync* {
                yield SizedBox(
                  height: 0.0,
                  width: gap,
                );
                yield item;
              })
              .skip(1)
              .toList(),
        ));
  }
}
