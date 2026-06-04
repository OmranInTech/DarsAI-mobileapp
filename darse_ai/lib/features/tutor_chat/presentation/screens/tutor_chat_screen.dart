import 'package:flutter/material.dart';
import 'dart:async';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/network/ai_api_client.dart';
import '../../../../core/services/ai_service.dart';

class TutorChatScreen extends StatefulWidget {
  const TutorChatScreen({super.key});

  @override
  State<TutorChatScreen> createState() => _TutorChatScreenState();
}

class _TutorChatScreenState extends State<TutorChatScreen> {
  final TextEditingController controller = TextEditingController();

  late AiService aiService;
  bool isLoading = false;

  final List<Map<String, String>> messages = [
    {"role": "ai", "text": "Hi, I am Darse AI. Ask me anything."}
  ];

  @override
  void initState() {
    super.initState();

    final client = AiApiClient(
      baseUrl: "http://localhost:3000", // change later to your backend
    );

    aiService = AiService(client: client);
  }

  Future<void> sendMessage() async {
    final text = controller.text.trim();
    if (text.isEmpty || isLoading) return;

    setState(() {
      messages.add({"role": "user", "text": text});
      messages.add({"role": "ai", "text": "Thinking..."});
      isLoading = true;
    });

    controller.clear();

    try {
      final response = await aiService.chat(text);

      setState(() {
        messages.removeLast();
        messages.add({"role": "ai", "text": response});
      });
    } catch (e) {
      setState(() {
        messages.removeLast();
        messages.add({
          "role": "ai",
          "text": "Error: Unable to connect AI service."
        });
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Darse AI Chat"),
      ),

      body: Column(
        children: [
          // 💬 CHAT LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg["role"] == "user";

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    constraints: const BoxConstraints(maxWidth: 280),
                    decoration: BoxDecoration(
                      color: isUser
                          ? AppColors.userBubble
                          : AppColors.aiBubble,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Text(
                      msg["text"] ?? "",
                      style: AppStyles.body,
                    ),
                  ),
                );
              },
            ),
          ),

          // ✍️ INPUT AREA
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFF0E0E10),
              border: Border(
                top: BorderSide(color: Colors.white10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Ask anything...",
                      hintStyle: const TextStyle(color: Colors.white38),
                      filled: true,
                      fillColor: AppColors.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: sendMessage,
                  icon: const Icon(Icons.send, color: AppColors.primary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}