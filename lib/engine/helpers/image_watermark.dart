// import 'dart:async';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;

// Future<Uint8List> addWatermarkToImage(
//     Uint8List imageBytes, String watermarkText) async {
//   img.Image originalImage = img.decodeImage(imageBytes)!;

//   // Set properties for the watermark text
//   final textStyle = ui.TextStyle(
//     color: Colors.white,
//     fontSize: 20.0,
//   );

//   // Create a Paragraph using the watermark text
//   ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
//     ui.ParagraphStyle(
//       fontSize: 24.0,
//       textAlign: TextAlign.left,
//       fontWeight: FontWeight.bold,
//       fontStyle: FontStyle.normal,
//     ),
//   )
//     ..pushStyle(textStyle)
//     ..addText(watermarkText);

//   ui.Paragraph paragraph = paragraphBuilder.build()
//     ..layout(ui.ParagraphConstraints(width: originalImage.width.toDouble()));

//   ui.PictureRecorder recorder = ui.PictureRecorder();
//   ui.Canvas canvas = ui.Canvas(
//     recorder,
//     Rect.fromPoints(
//       Offset(0.0, 0.0),
//       Offset(originalImage.width.toDouble(), originalImage.height.toDouble()),
//     ),
//   );

//   // Convert img.Image to ui.Image
//   ui.Image imgUI =
//       await decodeImage(Uint8List.fromList(img.encodePng(originalImage)!));

//   // Draw the original image
//   canvas.drawImage(imgUI, Offset(0.0, 0.0), Paint());

//   // Draw the watermark text at the specified coordinates
//   canvas.drawParagraph(paragraph, Offset(20.0, 20.0));

//   // Convert the UI drawing to an image
//   ui.Image resultImage = await recorder
//       .endRecording()
//       .toImage(originalImage.width, originalImage.height);

//   ByteData? byteData =
//       await resultImage.toByteData(format: ui.ImageByteFormat.png);
//   Uint8List watermarkedImageBytes = byteData!.buffer.asUint8List();

//   return watermarkedImageBytes;
// }

// Future<ui.Image> decodeImage(Uint8List list) async {
//   Completer<ui.Image> completer = Completer<ui.Image>();

//   void callback(ui.Image image) {
//     completer.complete(image);
//   }

//   ui.decodeImageFromList(list, callback);

//   return completer.future;
// }
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:armory/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

Future<Uint8List> addWatermarkToImage(
  Uint8List imageBytes,
  String watermarkText,
) async {
  // Decode the original image
  img.Image originalImage = img.decodeImage(imageBytes)!;

  // Resize the original image to a smaller size
  img.Image resizedImage = img.copyResize(originalImage, width: 800);

  // Set properties for the watermark text
  final textStyle = ui.TextStyle(
    color: Colors.white,
    fontSize: 36.0,
  );

  // Create a Paragraph using the watermark text
  ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
    ui.ParagraphStyle(
      fontSize: 36.0,
      textAlign: TextAlign.left,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
  )
    ..pushStyle(textStyle)
    ..addText(watermarkText);

  ui.Paragraph paragraph = paragraphBuilder.build()
    ..layout(ui.ParagraphConstraints(width: resizedImage.width.toDouble()));

  ui.PictureRecorder recorder = ui.PictureRecorder();
  ui.Canvas canvas = ui.Canvas(
    recorder,
    Rect.fromPoints(
      Offset(0.0, 0.0),
      Offset(resizedImage.width.toDouble(), resizedImage.height.toDouble()),
    ),
  );

  // Convert img.Image to ui.Image
  ui.Image imgUI =
      await decodeImage(Uint8List.fromList(img.encodePng(resizedImage)));

  // Draw the resized image
  canvas.drawImage(imgUI, Offset(0.0, 0.0), Paint());

  // Load the watermark image from assets
  ByteData watermarkData =
      await rootBundle.load(Resources.images.armorWithoutText.path);
  Uint8List watermarkBytes = watermarkData.buffer.asUint8List();
  ui.Image watermarkImage = await decodeImage(watermarkBytes);

  // Resize the watermark image to half of its original size
  double resizedWidth = watermarkImage.width.toDouble() / 2;
  double resizedHeight = watermarkImage.height.toDouble() / 2;
  watermarkImage =
      await decodeImage(Uint8List.fromList(img.encodePng(img.copyResize(
    img.decodeImage(watermarkBytes)!,
    width: resizedWidth.toInt(),
    height: resizedHeight.toInt(),
  ))));

  // Calculate the position for the watermark text (left bottom corner)
  double textX = 20.0;
  double textY = resizedImage.height.toDouble() - paragraph.height - 20.0;

  // Draw the watermark text at the specified coordinates
  canvas.drawParagraph(paragraph, Offset(textX, textY));

  // Calculate the position for the watermark image (bottom right corner)
  double imageX = resizedImage.width.toDouble() - resizedWidth - 20.0;
  double imageY = resizedImage.height.toDouble() - resizedHeight - 20.0;

  // Draw the resized watermark image at the specified coordinates
  canvas.drawImage(watermarkImage, Offset(imageX, imageY), Paint());

  // Convert the UI drawing to an image
  ui.Image resultImage = await recorder
      .endRecording()
      .toImage(resizedImage.width, resizedImage.height);

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
