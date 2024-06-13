import 'package:flutter/material.dart';

class KeepAliveItem extends StatefulWidget {
  const KeepAliveItem(
      {super.key,
      required this.index,
      required this.lastIndex,
      required this.child,
      this.gap = 0.0});

  final Widget child;
  final int index;
  final int lastIndex;
  final double gap;

  @override
  State<KeepAliveItem> createState() => _KeepAliveItemState();
}

class _KeepAliveItemState extends State<KeepAliveItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.index != widget.lastIndex) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [widget.child, SizedBox(height: widget.gap)]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [widget.child],
    );
  }
}
