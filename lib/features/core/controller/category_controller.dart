import 'package:get/get.dart';
import 'package:project_secondbite/data/repositories/categories_repository.dart';
import 'package:project_secondbite/features/core/models/categories_model.dart';
import 'package:project_secondbite/utils/popups/loader.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoriesRepository());
  RxList<CategoriesModel> allCategories = <CategoriesModel>[].obs;
  RxList<CategoriesModel> featuredCategories = <CategoriesModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured)
          .take(6)
          .toList());
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
