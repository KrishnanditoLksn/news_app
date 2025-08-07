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
      appBar: AppBar(
        title: Text("Summary Result", style: TextStyle(fontFamily: "Poppins")),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: geminiService.getSummaryResult(newsTitle),
        builder: (BuildContext context, AsyncSnapshot<String?> summary) {
          if (summary.hasData) {
            String newsSummary = summary.data!;
            return Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 201, 189, 189),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8.0)],
              ),
              child: Text(
                newsSummary,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            );
          }
          if (summary.hasError) {
            return Text(
              "Error ${summary.error}",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
