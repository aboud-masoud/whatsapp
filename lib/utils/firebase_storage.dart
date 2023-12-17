import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class MyFirebaseStorage {
  static FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uplaodFile({required String fileName, required File file}) async {
    try {
      await storage.ref().child('images/$fileName').putFile(file);
    } catch (e) {
      print(e);
    }
  }

  Future<String> getDownloadURL(String filename) async {
    try {
      return await FirebaseStorage.instance.ref().child('images/$filename').getDownloadURL();
    } catch (e) {
      return "";
    }
  }

  // Reference reference = storage.ref().child("images/");

  // UploadTask uploadTask = reference.putFile(file);

  // final snapshot = await uploadTask.whenComplete(() async {
  //   final snapshot = uploadTask.snapshot;
  //   final url = await snapshot.ref.getDownloadURL();
  //   print(url);
  // });
  // }
}
