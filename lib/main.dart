import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:starwars/provider/gemini_chat_provider.dart';
import 'package:starwars/screens/main/main_page.dart';
import 'package:starwars/services/api/api_key.dart';
import 'package:starwars/services/api/gemini_api_service.dart';

void main() {
  Gemini.init(apiKey: geminiApiKey);
  runApp(
    ChangeNotifierProvider<GeminiChatProvider>(
      create: (context) => GeminiChatProvider(GeminiApiService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage(), debugShowCheckedModeBanner: false);
  }
}
