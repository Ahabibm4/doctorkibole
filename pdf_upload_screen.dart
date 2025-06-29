import 'package:flutter/material.dart';

class PDFUploadScreen extends StatelessWidget {
  const PDFUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF আপলোড")),
      body: const Center(child: Text("PDF রিপোর্ট থেকে লেখা বের করা হবে এখানে")),
    );
  }
}
