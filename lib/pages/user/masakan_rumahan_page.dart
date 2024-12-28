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

class MasakanRumahanPage extends StatelessWidget {
  const MasakanRumahanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Masakan Rumahan Indonesia',
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
                'Temukan Resep Masakan Rumahan Favorit Anda',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // List of home-cooked dishes
              for (var recipe in masakanRumahanRecipes)
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

// Example data for home-cooked Indonesian dishes
final List<Resep> masakanRumahanRecipes = [
  Resep(
    title: 'Nasi Goreng',
    description: 'Hidangan nasi goreng yang kaya rasa dengan rempah-rempah dan sayuran.',
    imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.7xYghAGfVrsTkU7nwJC2pQHaFP&pid=Api&P=0&h=180',
    ingredients: [
      '2 piring nasi',
      '2 siung bawang merah',
      '2 siung bawang putih',
      '1 butir telur',
      'Kecap manis',
      'Garam dan merica',
      'Sayuran (wortel, kacang polong)',
    ],
    steps: [
      'Tumis bawang merah dan bawang putih hingga harum.',
      'Masukkan telur, orak-arik hingga matang.',
      'Tambahkan nasi, kecap manis, garam, dan merica.',
      'Campur semua bahan hingga merata dan tambahkan sayuran.',
      'Sajikan hangat.'
    ],
  ),
  Resep(
    title: 'Sate Ayam',
    description: 'Tusuk sate ayam bakar yang disajikan dengan saus kacang.',
    imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.LpoqLeYdiIMyNjdgr8QJEwHaD2&pid=Api&P=0&h=180',
    ingredients: [
      '500 gr ayam fillet',
      '10 tusuk sate',
      'Bumbu kacang',
      'Kecap manis',
      'Minyak untuk memanggang',
    ],
    steps: [
      'Tusuk ayam ke tusuk sate.',
      'Panggang sate hingga matang.',
      'Sajikan dengan bumbu kacang dan kecap manis.'
    ],
  ),
  Resep(
    title: 'Gado-Gado',
    description: 'Salad tradisional Indonesia dengan saus kacang.',
    imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.QcIgTOIeC4F15OSEqJNQVgHaEK&pid=Api&P=0&h=180',
    ingredients: [
      'Sayuran rebus (kentang, wortel, kol)',
      'Telur rebus',
      'Tahu tempe',
      'Saus kacang',
    ],
    steps: [
      'Rebus sayuran dan potong-potong.',
      'Rebus telur dan potong menjadi dua.',
      'Tata sayuran, telur, tahu tempe, dan siram dengan saus kacang.'
    ],
  ),
  Resep(
    title: 'Ayam Goreng',
    description: 'Ayam goreng renyah yang lezat dengan bumbu khas Indonesia.',
    imageUrl: 'https://www.sajianlezat.com/media/image/ayam/ayam-goreng-lengkuas.jpg',
    ingredients: [
      '1 ekor ayam, potong-potong',
      '2 siung bawang putih, haluskan',
      '1 batang serai, memarkan',
      'Daun jeruk',
      'Kecap manis',
      'Minyak goreng',
    ],
    steps: [
      'Bumbui ayam dengan bawang putih, serai, daun jeruk, dan kecap manis.',
      'Diamkan selama 30 menit agar bumbu meresap.',
      'Goreng ayam dalam minyak panas hingga kecokelatan.',
      'Angkat dan tiriskan, sajikan.'
    ],
  ),
  Resep(
    title: 'Sayur Asem',
    description: 'Sup sayuran asam segar yang kaya rasa.',
    imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2020/09/30/sayur-asem-3.jpeg?w=700',
    ingredients: [
      '1 buah jagung manis, potong-potong',
      '200 gr kacang panjang, potong-potong',
      '1 buah labu siam, potong-potong',
      '1 sdt asam jawa',
      'Bawang merah, bawang putih, dan cabai merah',
      'Daun salam, daun jeruk',
    ],
    steps: [
      'Rebus air bersama bahan sayur hingga matang.',
      'Tambahkan bumbu halus dan asam jawa.',
      'Masak hingga sayur empuk dan kuah agak asam.',
      'Angkat dan sajikan hangat.'
    ],
  ),
  Resep(
    title: 'Pepes Ikan',
    description: 'Ikan yang dibungkus daun pisang dengan bumbu rempah yang kaya.',
    imageUrl: 'https://wiratech.co.id/wp-content/uploads/2018/03/resep-pepes-ikan.jpg',
    ingredients: [
      '1 ekor ikan (seperti ikan mas atau ikan patin)',
      'Bumbu rempah (kemiri, bawang putih, kunyit)',
      'Daun pisang untuk membungkus',
      'Daun jeruk dan serai',
    ],
    steps: [
      'Haluskan bumbu rempah dan lumuri ikan dengan bumbu.',
      'Bungkus ikan dalam daun pisang bersama daun jeruk dan serai.',
      'Kukus ikan hingga matang.',
      'Sajikan dengan nasi hangat.'
    ],
  ),
  Resep(
    title: 'Tahu Tempe Bacem',
    description: 'Tahu dan tempe yang dimasak dengan bumbu manis dan gurih.',
    imageUrl: 'https://kecipir.com/blog/wp-content/uploads/2022/12/resep-tempe-dan-tahu-bacem.jpg',
    ingredients: [
      '1 papan tempe, potong-potong',
      '1 blok tahu, potong-potong',
      'Bawang putih, bawang merah, kemiri',
      'Kecap manis, air kelapa',
    ],
    steps: [
      'Rebus tahu dan tempe dengan bumbu dan air kelapa hingga meresap.',
      'Goreng hingga kecokelatan.',
      'Angkat dan sajikan dengan nasi.'
    ],
  ),
  Resep(
    title: 'Opor Ayam',
    description: 'Ayam yang dimasak dengan kuah santan yang gurih.',
    imageUrl: 'https://t-2.tstatic.net/tribunnewswiki/foto/bank/images/opor-ayam-kuning-1.jpg',
    ingredients: [
      '1 ekor ayam, potong-potong',
      '1 liter santan',
      'Bawang putih, bawang merah, kunyit',
      'Daun salam dan serai',
      'Garam dan merica',
    ],
    steps: [
      'Tumis bumbu hingga harum.',
      'Tambahkan ayam dan masak hingga ayam setengah matang.',
      'Tuang santan dan masak hingga kuah kental dan ayam matang.',
      'Sajikan dengan nasi.'
    ],
  ),
  Resep(
    title: 'Sop Iga',
    description: 'Sop iga sapi dengan kaldu yang gurih dan daging yang empuk.',
    imageUrl: 'https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2020/02/sop-iga.jpg',
    ingredients: [
      '500 gr iga sapi',
      'Bawang putih, bawang merah, jahe',
      'Wortel dan kentang',
      'Daun bawang dan seledri',
    ],
    steps: [
      'Rebus iga hingga empuk dan keluar kaldu.',
      'Masukkan sayuran dan bumbu, masak hingga matang.',
      'Angkat dan sajikan dengan taburan seledri dan daun bawang.'
    ],
  ),
  Resep(
    title: 'Mie Goreng',
    description: 'Mie goreng yang sederhana namun penuh rasa.',
    imageUrl: 'https://www.sahabatyatim.com/wp-content/uploads/2023/11/mie-goreng-gerobak.jpg',
    ingredients: [
      '1 bungkus mie instan',
      'Bawang putih dan bawang merah',
      'Kecap manis',
      'Sayuran (kol, wortel)',
      'Telur',
    ],
    steps: [
      'Rebus mie instan sesuai petunjuk.',
      'Tumis bawang hingga harum, masukkan sayuran.',
      'Tambahkan mie instan, kecap manis, dan telur orak-arik.',
      'Aduk rata dan sajikan.'
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
