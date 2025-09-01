import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starwars/provider/gemini_chat_provider.dart';
import 'package:starwars/screens/main/main_page.dart';
import 'package:starwars/screens/onboarding/onboarding_screen.dart';
import 'package:starwars/services/api/api_key.dart';
import 'package:starwars/services/api/gemini_api_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final hasCompleteOnboard = prefs.getBool("hasCompleteOnboard") ?? false;

  Gemini.init(apiKey: geminiApiKey);
  runApp(
    ChangeNotifierProvider<GeminiChatProvider>(
      create: (context) => GeminiChatProvider(GeminiApiService()),
      child: MaterialApp(
        home: hasCompleteOnboard ? MainPage() : OnboardingScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}