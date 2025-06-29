import 'package:flutter/material.dart';
import 'services/gpt_service.dart';
import 'services/storage_service.dart';

class AIResultScreen extends StatefulWidget {
  final String input;

  const AIResultScreen({super.key, required this.input});

  @override
  State<AIResultScreen> createState() => _AIResultScreenState();
}

class _AIResultScreenState extends State<AIResultScreen> {
  String? _response;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _analyze();
  }

  void _analyze() async {
    final result = await GPTService().analyze(widget.input);
    await StorageService().saveHistory(widget.input, result);
    setState(() {
      _response = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GPT ফলাফল")),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Text(_response ?? "ত্রুটি ঘটেছে"),
              ),
      ),
    );
  }
}
