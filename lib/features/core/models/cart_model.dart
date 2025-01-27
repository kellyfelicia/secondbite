import 'package:project_secondbite/features/core/models/catalog_home_model.dart';

class CartItem {
  final FoodMenuItem item;
  final int quantity;

  CartItem({
    required this.item,
    this.quantity = 1,
  });

  double get totalPrice => item.price * quantity;

  String get name => item.name;
  String get img => item.img;
  double get price => item.price;
  String get id => item.id;
  String? get description => item.description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          item.name == other.item.name;

  @override
  int get hashCode => item.name.hashCode;
}
