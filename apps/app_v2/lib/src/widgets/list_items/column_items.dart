import 'package:flutter/material.dart';

class ColumnItems extends StatelessWidget {
  const ColumnItems(
      {super.key,
      this.gap = 0.0,
      required this.children,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.center});

  final double gap;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 0),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
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
