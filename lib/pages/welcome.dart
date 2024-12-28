import 'package:flutter/material.dart';
import 'package:kreasi_rasa/pages/login.dart';
import 'package:kreasi_rasa/pages/register.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange, // Warna AppBar lebih lembut
        title: const Text(
          'Halaman Welcome',
          style: TextStyle(color: Colors.white), // Menambahkan warna putih pada teks AppBar
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding tambahan untuk ruang yang lebih lapang
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Menambahkan logo gambar dari web
              Image.network(
                'https://static.vecteezy.com/system/resources/previews/003/703/647/large_2x/cooking-pot-logo-design-for-business-and-company-vector.jpg', // Ganti dengan URL logo Anda
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 32),
              
              // Menambahkan styling pada teks untuk membuatnya lebih menonjol
              const Text(
                'Welcome to Kreasi Rasa',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange, // Warna teks menjadi putih
                ),
              ),
              const SizedBox(height: 32),
              
              // Tombol Login dengan desain lebih soft
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange, // Tombol warna biru muda
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Sudut tombol lebih membulat
                  ),
                  elevation: 3, // Efek bayangan ringan
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks tombol menjadi putih
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Tombol Register dengan desain yang konsisten
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange, // Tombol warna hijau lembut
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Sudut tombol lebih membulat
                  ),
                  elevation: 3, // Efek bayangan ringan
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks tombol menjadi putih
                  ),
                ),
              ),
            ],
          ),
        ),
     ),
    );
  }
}