import 'package:flutter/material.dart';

// Data class for dessert recipe
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

class DessertPage extends StatelessWidget {
  const DessertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dessert Khas Indonesia',
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
                'Temukan Resep Dessert Indonesia Favorit Anda',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // List of desserts
              for (var recipe in dessertRecipes)
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

// Example data for Indonesian desserts
final List<Resep> dessertRecipes = [
  Resep(
    title: 'Klepon',
    description: 'Klepon adalah bola ketan isi kelapa parut dengan gula merah.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.U5b5c_tOVgVg9Ltt_zXjwwHaHa&pid=Api&P=0&h=180',
    ingredients: [
      '200 gr ketan putih',
      '100 gr kelapa parut kasar',
      '100 gr gula merah serut',
      'Pewarna hijau makanan',
    ],
    steps: [
      'Rendam ketan dalam air selama 1 jam, tiriskan.',
      'Buat bola-bola ketan, beri gula merah di tengahnya.',
      'Rebus bola ketan hingga matang, angkat dan gulingkan di kelapa parut.',
    ],
  ),
  Resep(
    title: 'Dadar Gulung',
    description: 'Dadar gulung adalah pancake tipis isi kelapa manis yang digulung.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.ei_4kKOh8d7BQpcZnY_M2gHaF7&pid=Api&P=0&h=180',
    ingredients: [
      '100 gr tepung terigu',
      '2 butir telur',
      '100 ml air',
      '50 gr kelapa parut manis',
    ],
    steps: [
      'Campurkan tepung terigu, telur, dan air, aduk rata.',
      'Masak adonan dalam wajan tipis hingga matang.',
      'Isi dengan kelapa manis dan gulung.',
    ],
  ),
  Resep(
    title: 'Es Teler',
    description: 'Es teler adalah campuran es serut dengan buah-buahan segar dan kelapa.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.KGRspGGxkDvh-VAaxMRPpQHaEo&pid=Api&P=0&h=180',
    ingredients: [
      '100 gr kelapa muda',
      '50 gr alpukat',
      '50 gr nangka',
      'Sirup coco pandan',
      'Es serut',
    ],
    steps: [
      'Siapkan mangkuk, masukkan kelapa muda, alpukat, dan nangka.',
      'Tambahkan es serut dan sirup coco pandan.',
      'Sajikan dalam mangkuk dan nikmati.',
    ],
  ),
  Resep(
    title: 'Lapis Surabaya',
    description: 'Kue lapis Surabaya adalah kue lapis dengan warna yang menarik dan rasa yang enak.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.O2wyD0jfx6PndAzy7ZZmkgHaE6&pid=Api&P=0&h=180',
    ingredients: [
      '200 gr tepung terigu',
      '4 butir telur',
      '150 gr mentega',
      '200 gr gula pasir',
      'Pewarna makanan',
    ],
    steps: [
      'Kocok telur dan gula hingga mengembang.',
      'Tambahkan mentega cair, tepung terigu, dan aduk rata.',
      'Panggang adonan dalam loyang, beri warna di setiap lapisan.',
    ],
  ),
  Resep(
    title: 'Es Krim Goreng',
    description: 'Es krim goreng adalah es krim yang dilapisi adonan tepung dan digoreng.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.FVVV5fO8nM6PZwX48SyQgQHaJ4&pid=Api&P=0&h=180',
    ingredients: [
      'Es krim vanilla',
      'Tepung terigu',
      'Telur',
      'Breadcrumbs',
    ],
    steps: [
      'Ambil es krim dan bulatkan, bekukan.',
      'Celupkan es krim ke dalam tepung, telur, dan breadcrumbs.',
      'Goreng sebentar hingga kecokelatan.',
    ],
  ),
  Resep(
    title: 'Sop Buah',
    description: 'Sop buah adalah campuran berbagai buah segar yang disiram dengan sirup manis.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.d1ddo2uQxQodBDk_B7tGAQHaEK&pid=Api&P=0&h=180',
    ingredients: [
      'Nangka',
      'Apel',
      'Melon',
      'Sirup merah',
      'Es batu serut',
    ],
    steps: [
      'Potong buah-buahan menjadi dadu.',
      'Campurkan buah dalam mangkuk.',
      'Tambahkan sirup dan es batu serut.',
    ],
  ),
  Resep(
    title: 'Kue Cubir',
    description: 'Kue cubir adalah kue basah dengan tekstur kenyal dan manis.',
    imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.H73YI9kcQNkT7er3jhv-jwHaHA&pid=Api&P=0&h=180',
    ingredients: [
      '200 gr tepung ketan',
      '100 gr kelapa parut',
      '150 gr gula merah',
      'Pewarna makanan',
    ],
    steps: [
      'Campurkan tepung ketan dengan air dan pewarna.',
      'Bentuk bola-bola kecil, isi dengan kelapa parut dan gula merah.',
      'Kukus hingga matang dan sajikan.',
    ],
  ),
  Resep(
    title: 'Pisang Goreng Coklat',
    description: 'Pisang goreng coklat adalah pisang goreng yang dilapisi coklat leleh.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.dRI2fgQK2-X5-ruPpFjcdwHaEo&pid=Api&P=0&h=180',
    ingredients: [
      '2 buah pisang kepok',
      'Coklat leleh',
      'Tepung terigu',
      'Minyak goreng',
    ],
    steps: [
      'Kupas pisang dan potong menjadi dua.',
      'Celupkan pisang dalam tepung, goreng hingga kecokelatan.',
      'Sirami pisang goreng dengan coklat leleh.',
    ],
  ),
  Resep(
    title: 'Bubur Sumsum',
    description: 'Bubur sumsum adalah bubur berbahan dasar tepung beras dengan kuah gula merah.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.NcGvdy0lIk6sqzDikcfgiQHaEK&pid=Api&P=0&h=180',
    ingredients: [
      '100 gr tepung beras',
      '500 ml air santan',
      '100 gr gula merah',
    ],
    steps: [
      'Campurkan tepung beras dan air santan, masak hingga kental.',
      'Buat kuah gula merah dengan gula merah dan air.',
      'Sajikan bubur sumsum dengan kuah gula merah.',
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
