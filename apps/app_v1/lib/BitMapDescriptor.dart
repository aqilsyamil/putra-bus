import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> getResizedMarkerIcon(String imagePath, int width, int height) async {
  ByteData data = await rootBundle.load(imagePath);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width, targetHeight: height);
  ui.FrameInfo fi = await codec.getNextFrame();
  ui.Image image = fi.image;

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final paint = Paint()..color = Colors.transparent;
  canvas.drawRect(Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()), paint);
  canvas.drawImage(image, Offset.zero, Paint());
  final picture = recorder.endRecording();
  final img = await picture.toImage(width, height);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final buffer = byteData!.buffer.asUint8List();

  return BitmapDescriptor.fromBytes(buffer);
}
