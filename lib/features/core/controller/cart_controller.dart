import 'package:get/get.dart';
import 'package:project_secondbite/features/core/models/cart_model.dart';
import 'package:project_secondbite/features/core/models/catalog_home_model.dart';

class CartController extends GetxController {
  // Observable map to store cart items and their quantities
  final RxMap<CartItem, int> _cartItems = <CartItem, int>{}.obs;

  // Getter for cart items
  Map<CartItem, int> get cartItems => _cartItems;

  void decrementQuantity(CartItem item) {
    if (_cartItems.containsKey(item)) {
      if (_cartItems[item]! > 1) {
        _cartItems[item] = _cartItems[item]! - 1;
      } else {
        _cartItems.remove(item);
      }
    }
  }

  void incrementQuantity(CartItem item) {
    if (_cartItems.containsKey(item)) {
      _cartItems[item] = _cartItems[item]! + 1;
    } else {
      _cartItems[item] = 1;
    }
  }

  void addToCart(FoodMenuItem menuItem) {
    final cartItem = CartItem(item: menuItem);
    if (_cartItems.containsKey(cartItem)) {
      _cartItems[cartItem] = _cartItems[cartItem]! + 1;
    } else {
      _cartItems[cartItem] = 1;
    }
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity <= 0) {
      _cartItems.remove(item);
    } else {
      _cartItems[item] = quantity;
    }
  }

  double getTotalPrice() {
    double total = 0;
    _cartItems.forEach((item, quantity) {
      total += item.item.price * quantity;
    });
    return total;
  }

  int get totalItems {
    int total = 0;
    _cartItems.forEach((item, quantity) {
      total += quantity;
    });
    return total;
  }
}