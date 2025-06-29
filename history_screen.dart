import 'package:flutter/material.dart';
import 'services/storage_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> _entries = [];

  @override
  void initState() {
    super.initState();
    StorageService().getHistory().then((data) {
      setState(() {
        _entries = data.reversed.toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ইতিহাস")),
      body: ListView.builder(
        itemCount: _entries.length,
        itemBuilder: (_, i) => ListTile(title: Text(_entries[i])),
      ),
    );
  }
}
