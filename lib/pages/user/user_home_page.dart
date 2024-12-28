import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Data class for recipe
class Resep {
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> steps;

  Resep({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
  });

  // Method to convert JSON to Resep object
  factory Resep.fromJson(Map<String, dynamic> json) {
    return Resep(
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
    );
  }
}

// Dummy function to simulate fetching recipes from an API or database
Future<List<Resep>> fetchRecipes() async {
  // Simulate a network delay
  await Future.delayed(Duration(seconds: 2));

  // Sample data simulating admin input
  return [
    Resep(
      title: 'Nasi Goreng',
      description: 'Nasi yang digoreng dengan bumbu spesial.',
      ingredients: ['2 piring nasi', '2 siung bawang merah', 'Kecap manis'],
      steps: ['Tumis bawang merah', 'Masukkan nasi, kecap manis', 'Sajikan'],
    ),
    Resep(
      title: 'Sate Ayam',
      description: 'Tusuk sate ayam bakar dengan saus kacang.',
      ingredients: ['500 gr ayam', 'Tusuk sate', 'Saus kacang'],
      steps: ['Tusuk ayam', 'Panggang sate', 'Sajikan dengan saus kacang'],
    ),
    // Add more recipes here if needed
  ];
}

class UserHomePage extends StatelessWidget {
  final String name;
  const UserHomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kreasi Rasa',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _logout(context, name);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, $name!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Temukan Resep Masakan Indonesia Baru dan Jelajahi Dunia Memasak!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // Featured Recipes (fetched from admin)
              const Text(
                'Rekomendasi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              FutureBuilder<List<Resep>>(
                future: fetchRecipes(),  // Call the function to fetch recipes
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    // No recipes available from admin
                    return Center(child: Text('Tidak ada resep tersedia.'));
                  } else {
                    List<Resep> recipes = snapshot.data!;
                    return Column(
                      children: recipes.map((recipe) {
                        return RecipeCard(
                          title: recipe.title,
                          description: recipe.description,
                          recipe: recipe,
                          onTap: () => _showRecipeDetails(context, recipe),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Logout function
  Future<void> _logout(BuildContext context, String name) async {
    bool? confirmLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log out'),
          content: Text('Are you sure you want to log out, $name?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.of(context).pop(true);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );

    if (confirmLogout == true) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  // Function to show recipe details
  void _showRecipeDetails(BuildContext context, Resep recipe) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(recipe.title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(recipe.description),
              const SizedBox(height: 10),
              Text('Ingredients:'),
              for (var ingredient in recipe.ingredients) Text('• $ingredient'),
              const SizedBox(height: 10),
              Text('Steps:'),
              for (var step in recipe.steps) Text('• $step'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

// Recipe card widget (without image)
class RecipeCard extends StatelessWidget {
  final String title;
  final String description;
  final Resep recipe; // Added recipe parameter
  final VoidCallback onTap;

  const RecipeCard({
    super.key,
    required this.title,
    required this.description,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 15),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
