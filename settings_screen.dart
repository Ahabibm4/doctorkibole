import 'package:flutter/material.dart';
import 'services/storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isPremium = false;

  @override
  void initState() {
    super.initState();
    StorageService().isPremiumUser().then((value) {
      setState(() => _isPremium = value);
    });
  }

  Future<void> _togglePremium() async {
    await StorageService().setPremium(!_isPremium);
    setState(() => _isPremium = !_isPremium);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("সেটিংস")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isPremium ? "আপনি প্রিমিয়াম ব্যবহারকারী" : "ফ্রি ব্যবহারকারী"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _togglePremium,
              child: Text(_isPremium ? "ডাউনগ্রেড করুন" : "প্রিমিয়াম চালু করুন"),
            ),
          ],
        ),
      ),
    );
  }
}
