import 'package:flutter/material.dart';

void showImageDialog(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Image.network(
          imagePath,
          fit: BoxFit.fitWidth,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      );
    },
  );
}
