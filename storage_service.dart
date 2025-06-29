import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> setPremium(bool isPremium) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isPremium", isPremium);
  }

  Future<bool> isPremiumUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isPremium") ?? false;
  }

  Future<void> saveHistory(String input, String response) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList("history") ?? [];
    history.add("🕒 ${DateTime.now()}
📤 $input
📥 $response");
    await prefs.setStringList("history", history);
  }

  Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("history") ?? [];
  }
}
