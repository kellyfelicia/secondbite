class FoodMenuItem {
  final String name;
  String img;
  final double price;
  final String? description;
  final String id; // Add description as an optional field

  FoodMenuItem({
    required this.name,
    required this.img,
    required this.price,
    this.description,
     required this.id
  });

  factory FoodMenuItem.fromJson(Map<String, dynamic> json) {
    return FoodMenuItem(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      price: json['price'].toDouble(),
      description: json['dsc'], // Ensure to parse description
    );
  }
}
