import 'package:flutter/material.dart';
import 'package:kreasi_rasa/pages/admin/admin_home_page.dart';
import 'package:kreasi_rasa/pages/user/user_home_page.dart';  // Pastikan import halaman user
import 'package:kreasi_rasa/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';  // Jangan lupa untuk menambahkan shared_preferences

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // GlobalKey untuk form validation

  Future<void> _login() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    final email = _emailController.text;
    final password = _passwordController.text;

    if (_formKey.currentState?.validate() ?? false) {
      // Lakukan login dan dapatkan data login (role dan name)
      final success = await loginProvider.login(email, password);

      if (success) {
        final prefs = await SharedPreferences.getInstance();
        final role = prefs.getString('role') ?? '';  // Ambil role dari SharedPreferences
        final name = prefs.getString('name') ?? '';  // Ambil nama pengguna dari SharedPreferences

        // Menentukan halaman yang akan dituju berdasarkan role
        if (role == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AdminHomePage(
                name: name,  // Kirimkan nama pengguna ke halaman admin
                role: role,   // Kirimkan role ke halaman admin
              ),
            ),
          );
        } else {
          // Jika role bukan 'admin', arahkan ke halaman user
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UserHomePage(
                name: name,  // Kirimkan nama pengguna ke halaman user
              ),
            ),
          );
        }
      } else {
        // Menampilkan error message jika login gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loginProvider.errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Login to Kreasi Rasa',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,  // Menambahkan form validation
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to Kreasi Rasa',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please login to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Username Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // Login Button
                  Consumer<LoginProvider>(
                    builder: (context, loginProvider, child) {
                      return loginProvider.isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Colors.deepOrange,
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            );
                    },
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Don\'t have an account? Contact your admin.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
