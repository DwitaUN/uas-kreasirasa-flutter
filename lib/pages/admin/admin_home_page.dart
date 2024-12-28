import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kreasi_rasa/provider/recipe_provider.dart';
import 'package:kreasi_rasa/pages/admin/recipe_page.dart';

class AdminHomePage extends StatelessWidget {
  final String name;
  final String role;

  AdminHomePage({required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home - Kreasi Rasa'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Salutation and User Name
            Text(
              'Welcome back, $role!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Hello, $name',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),

            // Action Buttons or Navigation
            ElevatedButton(
              onPressed: () {
                // Navigate to Manage Recipes
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                backgroundColor: Colors.orangeAccent,
              ),
              child: Text(
                'Manage Recipes',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),

            // Quick Stats Section
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Stats:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Recipes: 250',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Active Users: 500',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
