import 'package:flutter/material.dart';
import 'package:starwars/data/model/chatter.dart';
import 'package:starwars/services/api/gemini_api_service.dart';

class GeminiChatProvider extends ChangeNotifier {
  final List<Chatter> _messages = [];
  List<Chatter> get messages => List.unmodifiable(_messages);
  late String newsTile;

  final GeminiApiService geminiApiService;
  GeminiChatProvider(this.geminiApiService);

  Future<void> chatGemini(String input) async {
    if (input.isEmpty) return;

    _messages.add(Chatter(text: input, isUser: true));
    notifyListeners();

    String? res = await geminiApiService.chatbot(input);

    _messages.add(Chatter(text: res!, isUser: false));
    notifyListeners();
  }
}
