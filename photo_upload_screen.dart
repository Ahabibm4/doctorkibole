import 'package:flutter/material.dart';

class PhotoUploadScreen extends StatelessWidget {
  const PhotoUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ছবি আপলোড")),
      body: const Center(child: Text("এখানে ছবি আপলোড ও OCR যুক্ত হবে")),
    );
  }
}
