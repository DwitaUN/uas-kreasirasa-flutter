import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:kreasi_rasa/pages/welcome.dart';
import 'package:kreasi_rasa/provider/auth_provider.dart';
import 'package:kreasi_rasa/provider/recipe_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Enable Device Preview during development
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider()), // Provider for authentication
          ChangeNotifierProvider(create: (_) => RecipeProvider()), // Provider for recipes
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kreasi Rasa',
      locale: DevicePreview.locale(context), // Set locale for Device Preview
      builder: DevicePreview.appBuilder, // Integrate with Device Preview
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      home: const WelcomePage(), // Home page
    );
  }
}
