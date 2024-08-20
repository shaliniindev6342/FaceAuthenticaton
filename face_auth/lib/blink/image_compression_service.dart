

import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<Uint8List?> compressImage(Uint8List imageBytes) async {
  return await FlutterImageCompress.compressWithList(
    imageBytes,
    minWidth: 500, // Adjust these values according to your needs
    minHeight: 500,
    quality: 70, // Adjust the quality to reduce file size
  );
}