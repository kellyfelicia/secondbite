import 'dart:math';

import 'package:get/get.dart';
import 'package:project_secondbite/data/repositories/catalog_home_repository.dart';
import 'package:project_secondbite/features/core/models/catalog_home_model.dart';

class HomeController extends GetxController {
  final FoodMenuRepository _foodMenuRepository = FoodMenuRepository();
  var menuItems = <FoodMenuItem>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var wishlistItems = <FoodMenuItem>{}.obs;

  // Wishlist to track favorite items
  var wishlist = <FoodMenuItem>[].obs;

  final List<String> categories = [
    'bbqs',
    'best-foods',
    'breads',
    'burgers',
    'chocolates',
    'desserts',
    'drinks',
    'fried-chicken',
    'ice-cream',
    'pizzas',
    'porks',
    'sandwiches',
    'sausages',
  ];

  final Set<String> fetchedCategories = Set();
  static const int itemsPerCategory = 10;
  final carouselCurrentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadMenuInBatches();
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> _loadMenuInBatches() async {
    try {
      isLoading(true);
      menuItems.clear(); // Clear existing items before loading new ones

      for (var category in categories) {
        if (fetchedCategories.contains(category)) {
          continue;
        }

        final items = await _foodMenuRepository.fetchMenu(category,
            limit: itemsPerCategory);
        final limitedItems = items.take(itemsPerCategory).toList();
        menuItems.addAll(limitedItems);
        fetchedCategories.add(category);
      }

      menuItems.shuffle(Random());
    } catch (e) {
      errorMessage.value = 'Error loading menu: $e';
    } finally {
      isLoading(false);
    }
  }

  // Add item to wishlist
  void toggleWishlist(FoodMenuItem item) {
    if (isInWishlist(item)) {
      wishlistItems.remove(item);
    } else {
      wishlistItems.add(item);
    }
    // Trigger update to refresh UI
    wishlistItems.refresh();
  }

  // Check if an item is in wishlist
  bool isInWishlist(FoodMenuItem item) {
    return wishlistItems.contains(item);
  }

  // Get wishlist items as a list
  List<FoodMenuItem> get wishlistAsList => wishlistItems.toList();
}
