import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:starwars/screens/main/main_page.dart';
import 'package:starwars/services/api/api_key.dart';

void main() {
  Gemini.init(
    apiKey: geminiApiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage(), debugShowCheckedModeBanner: false);
  }
}
