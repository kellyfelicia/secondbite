import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodMenuService {
  final String baseUrl = 'https://free-food-menus-api-production.up.railway.app';

  // Fetch all menus
  Future<List<dynamic>> fetchMenus() async {
    final response = await http.get(Uri.parse('$baseUrl/menus'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Decode JSON to List
    } else {
      throw Exception('Failed to load menus');
    }
  }

  // Fetch menu details by ID
  Future<Map<String, dynamic>> fetchMenuDetails(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/menus/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Decode JSON to Map
    } else {
      throw Exception('Failed to load menu details');
    }
  }
}
