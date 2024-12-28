import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kreasi_rasa/models/recipe.dart';

class ApiService {
  final String apiUrl = "http://10.0.2.2:8000/api/recipes"; // Ubah sesuai URL API kamu

  Future<List<Recipe>> getRecipes() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((recipe) => Recipe.fromJson(recipe)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future<Recipe> createRecipe(Recipe recipe) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(recipe.toJson()),
    );
    if (response.statusCode == 201) {
      return Recipe.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create recipe');
    }
  }

  Future<void> updateRecipe(int id, Recipe recipe) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(recipe.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update recipe');
    }
  }

  Future<void> deleteRecipe(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete recipe');
    }
  }
}
