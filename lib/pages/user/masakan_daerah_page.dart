import 'package:flutter/material.dart';

// Data class for recipe
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

class MasakanKhasDaerahPage extends StatelessWidget {
  const MasakanKhasDaerahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Masakan Khas Daerah Indonesia',
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
                'Temukan Resep Masakan Khas Daerah Indonesia',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // List of regional Indonesian dishes
              for (var recipe in masakanKhasDaerahRecipes)
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

// Example data for Indonesian regional dishes
final List<Resep> masakanKhasDaerahRecipes = [
  Resep(
    title: 'Rendang',
    description: 'Masakan daging sapi dengan bumbu rempah kaya asal Padang.',
    imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.BU9i60u0sfWRgWi95VgGmAHaEo&pid=Api&P=0&h=180',
    ingredients: [
      '1 kg daging sapi, potong dadu',
      '200 ml santan kental',
      '2 batang serai, memarkan',
      '5 lembar daun jeruk',
      '10 buah cabai merah',
      'Bawang merah, bawang putih, kunyit, jahe, dan rempah-rempah',
    ],
    steps: [
      'Tumis bumbu halus hingga harum.',
      'Masukkan daging sapi, aduk rata.',
      'Tambahkan santan dan rempah-rempah, masak hingga daging empuk.',
      'Masak dengan api kecil hingga kuah menyusut dan bumbu meresap.'
    ],
  ),
  Resep(
    title: 'Soto Betawi',
    description: 'Soto khas Jakarta yang berisi daging sapi dengan kuah santan.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.lf1_tux2_5jwd4oXrH9v7AHaEK&pid=Api&P=0&h=180',
    ingredients: [
      '500 gr daging sapi, potong kecil',
      '200 ml santan',
      'Bawang merah, bawang putih, jahe, kunyit',
      'Daun salam, serai',
      'Kentang, tomat, dan seledri',
    ],
    steps: [
      'Rebus daging sapi hingga empuk.',
      'Tumis bumbu hingga harum, masukkan ke dalam panci.',
      'Tambahkan santan dan masak hingga kuah mendidih.',
      'Sajikan dengan kentang goreng dan taburan seledri.'
    ],
  ),
  Resep(
    title: 'Gudeg',
    description: 'Masakan khas Yogyakarta yang terbuat dari nangka muda.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.k2-J51ThIhvOMhnyVf64agHaFd&pid=Api&P=0&h=180',
    ingredients: [
      '1 kg nangka muda, potong-potong',
      '200 ml santan',
      'Bawang merah, bawang putih, kemiri',
      'Daun salam, lengkuas, dan gula merah',
    ],
    steps: [
      'Rebus nangka muda hingga empuk.',
      'Tumis bumbu hingga harum, masukkan ke dalam panci.',
      'Tambahkan santan dan masak hingga kuah menyusut.',
      'Sajikan dengan ayam goreng dan sambal.'
    ],
  ),
  Resep(
    title: 'Pempek Palembang',
    description: 'Makanan khas Palembang yang terbuat dari ikan dan tepung sagu.',
    imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.sORp_7EdBfHtxEom-S6TYgHaEK&pid=Api&P=0&h=180',
    ingredients: [
      '500 gr ikan tenggiri, haluskan',
      '250 gr tepung sagu',
      '2 butir telur',
      'Bawang putih, daun bawang',
      'Cuka, gula, cabai untuk kuah',
    ],
    steps: [
      'Campurkan ikan tenggiri, tepung sagu, telur, dan bumbu hingga rata.',
      'Bentuk adonan menjadi bulat atau lonjong, kemudian rebus hingga matang.',
      'Sajikan dengan kuah cuka dan sambal.'
    ],
  ),
  Resep(
    title: 'Ayam Bakar Taliwang',
    description: 'Ayam bakar khas Lombok dengan bumbu pedas.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.ATtLxyk4J5ckkm-jV7mrVgHaEK&pid=Api&P=0&h=180',
    ingredients: [
      '1 ekor ayam, potong-potong',
      'Bawang merah, bawang putih, cabai rawit',
      'Kemiri, terasi, dan tomat',
      'Kecap manis',
    ],
    steps: [
      'Haluskan bumbu dan lumuri ayam dengan bumbu.',
      'Diamkan selama beberapa saat agar bumbu meresap.',
      'Panggang ayam hingga matang dan sajikan.'
    ],
  ),
  Resep(
    title: 'Bakso Malang',
    description: 'Bakso khas Malang yang berisi bola daging dan tahu.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.RgiBO8XMm6HRm9HfQQXP7QHaEo&pid=Api&P=0&h=180',
    ingredients: [
      '500 gr daging sapi giling',
      '100 gr tepung sagu',
      'Bawang putih, garam, merica',
      'Tahu, mie kunir, seledri',
    ],
    steps: [
      'Campurkan daging sapi dengan tepung sagu, bumbu, dan air.',
      'Bentuk adonan menjadi bola-bola kecil dan rebus.',
      'Sajikan dengan mie kunir, tahu, dan kuah kaldu.'
    ],
  ),
  Resep(
    title: 'Nasi Liwet Solo',
    description: 'Nasi khas Solo dengan bumbu gurih dan lauk sederhana.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.QdmJzX7d8VvkUbipS0V2FQHaEK&pid=Api&P=0&h=180',
    ingredients: [
      '2 cup beras',
      '1 batang serai, daun salam',
      'Bawang merah, bawang putih, lengkuas',
      'Ayam, ikan, atau tempe',
    ],
    steps: [
      'Cuci beras dan masak dengan bumbu.',
      'Tambahkan lauk seperti ayam atau tempe.',
      'Masak hingga nasi matang dan sajikan.'
    ],
  ),
  Resep(
    title: 'Tinutuan Manado',
    description: 'Sayur khas Manado yang kaya dengan sayuran dan labu.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.qpNOa7Ofxrz6SFPV7-ox2wHaEK&pid=Api&P=0&h=180',
    ingredients: [
      '200 gr jagung putih',
      '100 gr labu kunir, wortel',
      'Sayuran hijau (seperti daun kangkung)',
      'Garam, merica',
    ],
    steps: [
      'Rebus jagung dan sayuran hingga empuk.',
      'Tambahkan bumbu dan masak hingga matang.',
      'Sajikan dengan nasi atau lauk.'
    ],
  ),
  Resep(
    title: 'Coto Makassar',
    description: 'Sup daging khas Makassar dengan bumbu rempah yang khas.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.bpxq6pnXCBds6zpb4Rm8_wHaEK&pid=Api&P=0&h=180',
    ingredients: [
      '500 gr daging sapi',
      'Bawang merah, bawang putih, jahe, kunyit',
      'Daun jeruk, serai, lengkuas',
      'Santan',
    ],
    steps: [
      'Rebus daging sapi hingga empuk.',
      'Tumis bumbu hingga harum, masukkan ke dalam panci.',
      'Tambahkan santan dan bumbu rempah, masak hingga kuah kental.'
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
          ],
        ),
      ),
    );
  }
}
