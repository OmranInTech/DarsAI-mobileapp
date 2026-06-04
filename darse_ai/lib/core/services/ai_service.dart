import '../network/ai_api_client.dart';

class AiService {
  final AiApiClient client;

  AiService({required this.client});

  /// 💬 CHAT / CONVERSATION
  Future<String> chat(String message) async {
    final response = await client.post(
      endpoint: '/chat',
      body: {
        "message": message,
      },
    );

    return _extractText(response);
  }

  /// 🧠 SUMMARIZATION
  Future<String> summarize(String text, {int length = 5}) async {
    final response = await client.post(
      endpoint: '/summarize',
      body: {
        "text": text,
        "length": length,
      },
    );

    return _extractText(response);
  }

  /// 🎓 QUIZ GENERATION
  Future<List<Map<String, dynamic>>> generateQuiz(String topic) async {
    final response = await client.post(
      endpoint: '/quiz',
      body: {
        "topic": topic,
      },
    );

    final data = response['quiz'];

    if (data is List) {
      return List<Map<String, dynamic>>.from(data);
    }

    return [];
  }

  /// 🔧 SAFE RESPONSE PARSER
  String _extractText(Map<String, dynamic> response) {
    if (response.containsKey('text')) {
      return response['text'].toString();
    }

    if (response.containsKey('response')) {
      return response['response'].toString();
    }

    return response.toString();
  }
}