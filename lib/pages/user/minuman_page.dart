import 'package:flutter/material.dart';

// Data class for minuman recipe
class Resep {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;

  Resep({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });
}

class MinumanPage extends StatelessWidget {
  const MinumanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minuman Khas Indonesia',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Temukan Resep Minuman Indonesia Favorit Anda',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // List of beverages
              for (var recipe in minumanRecipes)
                RecipeCard(
                  title: recipe.title,
                  description: recipe.description,
                  imageUrl: recipe.imageUrl,
                  recipe: recipe,
                  onTap: () => _showRecipeDetails(context, recipe),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show detailed recipe information
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
              const Text('Ingredients:'),
              for (var ingredient in recipe.ingredients) Text('• $ingredient'),
              const SizedBox(height: 10),
              const Text('Steps:'),
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

// Example data for Indonesian beverages
final List<Resep> minumanRecipes = [
  Resep(
    title: 'Es Teh Manis',
    description: 'Es teh manis adalah minuman teh dengan tambahan gula yang segar.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.ZlAxeyDQz3A4nBD_6dpJHgHaEo&pid=Api&P=0&h=180',
    ingredients: [
      'Teh celup',
      'Gula pasir',
      'Es batu',
      'Air panas',
    ],
    steps: [
      'Seduh teh celup dengan air panas selama 5 menit.',
      'Tambahkan gula pasir dan aduk hingga larut.',
      'Masukkan es batu dan sajikan.',
    ],
  ),
  Resep(
    title: 'Es Jeruk',
    description: 'Es jeruk adalah minuman segar dari perasan jeruk dengan es.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.eN_jpKNls_C2qgZ5k53r0wHaF7&pid=Api&P=0&h=180',
    ingredients: [
      'Jeruk nipis',
      'Gula pasir',
      'Es batu',
      'Air matang',
    ],
    steps: [
      'Peras jeruk nipis dan campurkan dengan air matang.',
      'Tambahkan gula pasir dan aduk hingga larut.',
      'Masukkan es batu dan sajikan.',
    ],
  ),
  Resep(
    title: 'Bandrek',
    description: 'Bandrek adalah minuman hangat khas Sunda yang terbuat dari jahe dan rempah-rempah.',
    imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.lXz5ln7t2vh2ga4qq_aGGwHaEo&pid=Api&P=0&h=180',
    ingredients: [
      'Jahe',
      'Santan kelapa',
      'Gula merah',
      'Kayu manis',
      'Cengkeh',
      'Air',
    ],
    steps: [
      'Rebus air bersama dengan jahe, kayu manis, dan cengkeh.',
      'Tambahkan gula merah dan santan kelapa, aduk rata.',
      'Masak hingga harum dan sajikan dalam keadaan hangat.',
    ],
  ),
  Resep(
    title: 'Kopi Tubruk',
    description: 'Kopi tubruk adalah kopi khas Indonesia dengan gula yang langsung dicampurkan.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.P7FPWqUqY1cxpcX1kBPCuAHaFv&pid=Api&P=0&h=180',
    ingredients: [
      'Kopi bubuk',
      'Gula pasir',
      'Air panas',
    ],
    steps: [
      'Masukkan kopi bubuk dan gula pasir ke dalam gelas.',
      'Tuangkan air panas dan aduk hingga rata.',
      'Diamkan sejenak, lalu sajikan.',
    ],
  ),
  Resep(
    title: 'Es Kelapa Muda',
    description: 'Es kelapa muda adalah minuman segar yang terbuat dari air kelapa muda.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.lG2D3wO2pHLwNUF4u35TzgHaF_&pid=Api&P=0&h=180',
    ingredients: [
      'Air kelapa muda',
      'Daging kelapa muda',
      'Es batu',
      'Sirup kelapa',
    ],
    steps: [
      'Ambil air kelapa muda dan daging kelapa muda.',
      'Tambahkan sirup kelapa dan es batu.',
      'Sajikan dalam gelas dingin.',
    ],
  ),
  Resep(
    title: 'Es Cendol',
    description: 'Es cendol adalah minuman es dengan cendol hijau, santan, dan gula merah.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.VwTnXy8hNYcofBO2qkJcQQHaEK&pid=Api&P=0&h=180',
    ingredients: [
      'Cendol',
      'Santan kelapa',
      'Gula merah cair',
      'Es batu',
    ],
    steps: [
      'Siapkan cendol di dalam gelas.',
      'Tambahkan es batu dan siram dengan santan kelapa dan gula merah cair.',
      'Sajikan segera.',
    ],
  ),
  Resep(
    title: 'Jus Alpukat',
    description: 'Jus alpukat adalah minuman segar dengan tekstur lembut dan rasa manis.',
    imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.xlqFNO8no3rIbFkAjov5LgHaF7&pid=Api&P=0&h=180',
    ingredients: [
      'Alpukat',
      'Susu kental manis',
      'Air es',
      'Gula pasir',
    ],
    steps: [
      'Ambil daging alpukat dan blender dengan air es, susu kental manis, dan gula pasir.',
      'Sajikan dalam gelas dingin.',
    ],
  ),
  Resep(
    title: 'Teh Susu',
    description: 'Teh susu adalah minuman teh yang dicampur dengan susu manis.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.LceAG_kxK3be2X2P6NQkNQHaF7&pid=Api&P=0&h=180',
    ingredients: [
      'Teh celup',
      'Susu kental manis',
      'Air panas',
    ],
    steps: [
      'Seduh teh celup dengan air panas.',
      'Tambahkan susu kental manis, aduk rata.',
      'Sajikan dalam keadaan hangat atau dingin.',
    ],
  ),
  Resep(
    title: 'Bajigur',
    description: 'Bajigur adalah minuman manis dan gurih khas Jawa Barat yang menggunakan santan dan gula merah.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.bW_m0r0wDxu-TgiVFGjWRwHaE6&pid=Api&P=0&h=180',
    ingredients: [
      'Santan kelapa',
      'Gula merah',
      'Jahe',
      'Kayu manis',
      'Cengkeh',
    ],
    steps: [
      'Rebus santan kelapa bersama gula merah, jahe, kayu manis, dan cengkeh.',
      'Aduk rata hingga harum dan sajikan hangat.',
    ],
  ),
  Resep(
    title: 'Teh Tarik',
    description: 'Teh tarik adalah teh yang dicampur dengan susu kental manis dan ditarik agar berbusa.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.Tp-y6IuKkYn7mj0fwt6V5AHaEK&pid=Api&P=0&h=180',
    ingredients: [
      'Teh hitam',
      'Susu kental manis',
      'Air panas',
    ],
    steps: [
      'Seduh teh hitam dengan air panas.',
      'Tambahkan susu kental manis dan tarik teh untuk menghasilkan buih.',
      'Sajikan dalam gelas hangat.',
    ],
  ),
];

// Recipe card widget
class RecipeCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final Resep recipe;
  final VoidCallback onTap;

  const RecipeCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
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
        child: Row(
          children: [
            Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(description, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
