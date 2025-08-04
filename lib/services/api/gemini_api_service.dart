import 'package:flutter_gemini/flutter_gemini.dart';
// import 'package:starwars/data/model/summarize_response.dart';

class GeminiApiService {
  final gemini = Gemini.instance;

  Future<String?> getSummaryResult(String title) async {
    return gemini
        .prompt(
          parts: [Part.text("Using your knowledge , Provide a summary of $title")],
        )
        .then((value) {
          return value?.output;
        });
  }
}
