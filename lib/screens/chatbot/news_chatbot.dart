import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars/provider/gemini_chat_provider.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<StatefulWidget> createState() => ChatBotState();
}

class ChatBotState extends State<ChatBotScreen> {
  final TextEditingController _editingController = TextEditingController();
  // final service = GeminiApiService();

  // Future<void> _chatGemini() async {
  //   if (_editingController.text.isEmpty) return;

  //   final String prompt = _editingController.text;
  //   _editingController.clear();

  //   setState(() {
  //     _messages.add(Chatter(text: prompt, isUser: true));
  //   });

  //   String? res = await service.chatbot(prompt);

  //   setState(() {
  //     _messages.add(Chatter(text: res ?? '', isUser: false));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<GeminiChatProvider>();

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
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, idx) {
                final msg = chatProvider.messages[idx];
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
                                ? const Color.fromARGB(255, 128, 145, 178)
                                : const Color.fromARGB(255, 25, 61, 170),
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
                                  : const Color.fromARGB(255, 255, 255, 255),
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
                color: const Color.fromARGB(255, 215, 206, 206),
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
                  IconButton(
                    onPressed: () {
                      final prompt = _editingController.text;
                      _editingController.clear();
                      context.read()<GeminiChatProvider>().chatGemini(prompt);
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
