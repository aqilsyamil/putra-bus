import 'package:flutter/material.dart';

class RowItems extends StatelessWidget {
  const RowItems(
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
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
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
