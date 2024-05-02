import 'package:flutter/material.dart';

List<Widget> space(
    {required double height,
    required double width,
    required Iterable<Widget> children}) {
  return children
      .expand((item) sync* {
        yield SizedBox(
          height: height,
          width: width,
        );
        yield item;
      })
      .skip(1)
      .toList();
}
