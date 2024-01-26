import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:image/image.dart' as img;

Future<Uint8List> compressImage(File imageFile) async {
  // Baca bytes gambar dari file
  Uint8List imageBytes = await imageFile.readAsBytes();

  // Kompresi gambar dengan menggunakan paket image
  img.Image compressedImage = img.decodeImage(imageBytes)!;
  img.Image resizedImage = img.copyResize(compressedImage, width: 800);

  // Konversi gambar kembali ke bytes
  List<int> compressedBytes = img.encodePng(resizedImage);

  return Uint8List.fromList(compressedBytes);
}
