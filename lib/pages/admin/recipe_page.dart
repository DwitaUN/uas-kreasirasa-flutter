import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kreasi_rasa/models/recipe.dart';
import 'package:kreasi_rasa/provider/recipe_provider.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Recipes'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, recipeProvider, child) {
          return recipeProvider.loading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: recipeProvider.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipeProvider.recipes[index];
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(recipe.title),
                        subtitle: Text('Ingredients: ${recipe.ingredients}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Navigate to edit recipe page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditRecipePage(
                                      recipe: recipe,
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Delete recipe
                                recipeProvider.deleteRecipe(recipe.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add new recipe page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRecipePage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

class AddRecipePage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Recipe'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Recipe Title'),
            ),
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(labelText: 'Ingredients'),
            ),
            TextField(
              controller: _instructionsController,
              decoration: InputDecoration(labelText: 'Instructions'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newRecipe = Recipe(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: _titleController.text,
                  ingredients: _ingredientsController.text,
                  instructions: _instructionsController.text,
                );
                Provider.of<RecipeProvider>(context, listen: false)
                    .addRecipe(newRecipe);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent, // Ganti 'primary' dengan 'backgroundColor'
              ),
              child: Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditRecipePage extends StatelessWidget {
  final Recipe recipe;
  final TextEditingController _titleController;
  final TextEditingController _ingredientsController;
  final TextEditingController _instructionsController;

  EditRecipePage({required this.recipe})
      : _titleController = TextEditingController(text: recipe.title),
        _ingredientsController = TextEditingController(text: recipe.ingredients),
        _instructionsController = TextEditingController(text: recipe.instructions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Recipe Title'),
            ),
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(labelText: 'Ingredients'),
            ),
            TextField(
              controller: _instructionsController,
              decoration: InputDecoration(labelText: 'Instructions'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedRecipe = Recipe(
                  id: recipe.id,
                  title: _titleController.text,
                  ingredients: _ingredientsController.text,
                  instructions: _instructionsController.text,
                );
                Provider.of<RecipeProvider>(context, listen: false)
                    .updateRecipe(recipe.id, updatedRecipe);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent, // Ganti 'primary' dengan 'backgroundColor'
              ),
              child: Text('Update Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
