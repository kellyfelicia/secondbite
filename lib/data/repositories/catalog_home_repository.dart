import 'package:project_secondbite/features/core/models/catalog_home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodMenuRepository {

  final String baseUrl = 'https://free-food-menus-api-two.vercel.app';

  Future<List<FoodMenuItem>> fetchMenu(String category,
      {int limit = 10}) async {
    final response =
        await http.get(Uri.parse('$baseUrl/$category?limit=$limit'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => FoodMenuItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load menu items');
    }
  }
}
