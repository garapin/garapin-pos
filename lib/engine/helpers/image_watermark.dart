import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

Future<Uint8List> addWatermarkToImage(
    Uint8List imageBytes, String watermarkText) async {
  img.Image originalImage = img.decodeImage(imageBytes)!;

  // Set properties for the watermark text
  final textStyle = ui.TextStyle(
    color: Colors.white,
    fontSize: 20.0,
  );

  // Create a Paragraph using the watermark text
  ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
    ui.ParagraphStyle(
      fontSize: 24.0,
      textAlign: TextAlign.left,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
  )
    ..pushStyle(textStyle)
    ..addText(watermarkText);

  ui.Paragraph paragraph = paragraphBuilder.build()
    ..layout(ui.ParagraphConstraints(width: originalImage.width.toDouble()));

  ui.PictureRecorder recorder = ui.PictureRecorder();
  ui.Canvas canvas = ui.Canvas(
    recorder,
    Rect.fromPoints(
      Offset(0.0, 0.0),
      Offset(originalImage.width.toDouble(), originalImage.height.toDouble()),
    ),
  );

  // Convert img.Image to ui.Image
  ui.Image imgUI =
      await decodeImage(Uint8List.fromList(img.encodePng(originalImage)!));

  // Draw the original image
  canvas.drawImage(imgUI, Offset(0.0, 0.0), Paint());

  // Draw the watermark text at the specified coordinates
  canvas.drawParagraph(paragraph, Offset(20.0, 20.0));

  // Convert the UI drawing to an image
  ui.Image resultImage = await recorder
      .endRecording()
      .toImage(originalImage.width, originalImage.height);

  ByteData? byteData =
      await resultImage.toByteData(format: ui.ImageByteFormat.png);
  Uint8List watermarkedImageBytes = byteData!.buffer.asUint8List();

  return watermarkedImageBytes;
}

Future<ui.Image> decodeImage(Uint8List list) async {
  Completer<ui.Image> completer = Completer<ui.Image>();

  void callback(ui.Image image) {
    completer.complete(image);
  }

  ui.decodeImageFromList(list, callback);

  return completer.future;
}
