import 'package:flutter/material.dart';
import 'package:kreasi_rasa/models/recipe.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  bool _loading = false;

  List<Recipe> get recipes => _recipes;
  bool get loading => _loading;

  // Simulate fetching data from an API
  Future<void> fetchRecipes() async {
    _loading = true;
    notifyListeners(); // Notify listeners to update UI while loading data

    // Simulate a network request with a delay (e.g., 2 seconds)
    await Future.delayed(const Duration(seconds: 2));

    // Example of static recipe data (you would replace this with API data)
    _recipes = [
      Recipe(id: 1, title: 'Recipe 1', ingredients: 'Ingredient 1', instructions: 'Step 1'),
      Recipe(id: 2, title: 'Recipe 2', ingredients: 'Ingredient 2', instructions: 'Step 2'),
    ];

    _loading = false; // Set loading to false once data is fetched
    notifyListeners(); // Notify listeners to rebuild the UI with the new data
  }

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners(); // Notify listeners when a new recipe is added
  }

  void updateRecipe(int id, Recipe recipe) {
    int index = _recipes.indexWhere((r) => r.id == id);
    if (index != -1) {
      _recipes[index] = recipe;
      notifyListeners(); // Notify listeners when a recipe is updated
    }
  }

  void deleteRecipe(int id) {
    _recipes.removeWhere((r) => r.id == id);
    notifyListeners(); // Notify listeners when a recipe is deleted
  }
}
