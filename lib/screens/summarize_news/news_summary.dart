import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:starwars/services/api/gemini_api_service.dart';

class NewsSummary extends StatelessWidget {
  final String newsTitle;
  final gemini = Gemini.instance;
  final geminiService = GeminiApiService();

  NewsSummary(this.newsTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Summary Result")),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: geminiService.getSummaryResult(newsTitle),
        builder: (BuildContext context, AsyncSnapshot<String?> summary) {
          if (summary.hasData) {
            String newsSummary = summary.data!;
            Container(
              margin: EdgeInsets.all(8.0),
              child: Text(
                newsSummary,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
