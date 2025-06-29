import 'package:http/http.dart' as http;
import 'dart:convert';
import 'storage_service.dart';

class GPTService {
  Future<String> analyze(String prompt) async {
    final isPremium = await StorageService().isPremiumUser();
    final model = isPremium ? "gpt-4" : "gpt-3.5-turbo";

    const apiKey = "your_api_key_here"; // Replace with your OpenAI key

    final url = Uri.https("api.openai.com", "/v1/chat/completions");
    final res = await http.post(url,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "model": model,
          "messages": [
            {"role": "system", "content": "তুমি একজন বাংলা ভাষার ডাক্তার সহকারী।"},
            {"role": "user", "content": prompt}
          ]
        }));

    final data = jsonDecode(res.body);
    return data['choices'][0]['message']['content'];
  }
}
