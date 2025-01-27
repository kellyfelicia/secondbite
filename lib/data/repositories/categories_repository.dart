import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/core/models/categories_model.dart';
import 'package:project_secondbite/services/firebase_storage_service.dart';
import 'package:project_secondbite/utils/exceptions/firebase_exception.dart';
import 'package:project_secondbite/utils/exceptions/format_exception.dart';
import 'package:project_secondbite/utils/exceptions/platform_exception.dart';

class CategoriesRepository extends GetxController {
  static CategoriesRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  Future<List<CategoriesModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoriesModel.fromSnapshot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadDummyData(List<CategoriesModel> categories) async {
    try {
      final storage = Get.put(AppFirebaseStorageService());

      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        final url =
            await storage.uploadImageData('Categories', file, category.name);

        category.image = url;
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
