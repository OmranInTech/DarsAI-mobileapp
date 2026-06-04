import 'dart:convert';
import 'package:http/http.dart' as http;

class AiApiClient {
  final String baseUrl;
  final Duration timeout;

  AiApiClient({
    required this.baseUrl,
    this.timeout = const Duration(seconds: 30),
  });

  /// 🔥 Generic POST request to AI backend
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              ...?headers,
            },
            body: jsonEncode(body),
          )
          .timeout(timeout);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
          'AI API Error: ${response.statusCode} ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Network Error: $e');
    }
  }
}