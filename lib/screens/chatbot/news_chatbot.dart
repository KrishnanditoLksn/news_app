import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:starwars/data/model/chatter.dart';
import 'package:starwars/services/api/gemini_api_service.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<StatefulWidget> createState() => ChatBotState();
}

class ChatBotState extends State<ChatBotScreen> {
  final List<Chatter> _messages = [
    Chatter(text: "Hallo", isUser: true),
    Chatter(text: "Apakabar", isUser: false),
  ];
  final TextEditingController _editingController = TextEditingController();
  final service = GeminiApiService();

  Future<void> _chatGemini() async {
    if (_editingController.text.isEmpty) return;

    final String prompt = _editingController.text;
    _editingController.clear();

    setState(() {
      _messages.add(Chatter(text: prompt, isUser: true));
    });

    String? res = await service.chatbot(prompt);

    setState(() {
      _messages.add(Chatter(text: res ?? '', isUser: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Gemini Chatbot"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, idx) {
                final msg = _messages[idx];
                return ListTile(
                  title: Align(
                    alignment:
                        msg.isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            msg.isUser
                                ? Colors.grey
                                : const Color.fromARGB(255, 52, 39, 2),
                        borderRadius:
                            msg.isUser
                                ? BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )
                                : BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                      ),
                      child: Text(
                        msg.text,
                        style: TextStyle(
                          color:
                              msg.isUser
                                  ? Colors.white
                                  : const Color.fromARGB(255, 255, 187, 0),
                          fontFamily: "Poppins",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          //INPUT
          Padding(
            padding: EdgeInsets.only(bottom: 5, top: 14, left: 20, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 136, 136, 136),
                borderRadius: BorderRadius.circular(32),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        textInputAction: TextInputAction.go,
                        controller: _editingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: _chatGemini, icon: Icon(Icons.send)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
