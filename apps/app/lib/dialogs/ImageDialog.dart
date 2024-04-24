import 'package:flutter/material.dart';

void showImageDialog(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Image.asset(imagePath),
      );
    },
  );
}