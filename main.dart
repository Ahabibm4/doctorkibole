import 'package:flutter/material.dart';
import 'main_shell.dart';

void main() {
  runApp(const DoctorKiBoleApp());
}

class DoctorKiBoleApp extends StatelessWidget {
  const DoctorKiBoleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Ki Bole',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const MainShell(),
      debugShowCheckedModeBanner: false,
    );
}
