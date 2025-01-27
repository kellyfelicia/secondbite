import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppFirebaseStorageService extends GetxController{
  static AppFirebaseStorageService get to => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try{
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> uploadImageData(String path, Uint8List imageData, String name) async {
    try{
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(imageData);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if(e is FirebaseException){
        throw 'Firebase Exception: ${e.message}';
      }else if(e is SocketException){
        throw 'Socket Exception: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else{
        throw 'Something went wrong. Please try again';
      }
    }
  }
}