import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadImageToStorage(Uint8List imageBytes, String userId) async {
  final storageRef = FirebaseStorage.instance.ref().child("users/$userId.jpg");
  await storageRef.putData(imageBytes);
  return await storageRef.getDownloadURL();
}
