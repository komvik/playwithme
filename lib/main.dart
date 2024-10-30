import 'package:flutter/material.dart';
import 'package:projekt_481_play_with_me/config/theme.dart';
import 'package:projekt_481_play_with_me/feature/authorization/screens/authorization_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Willkommen,\nSpiel mit uns",
      theme: myTheme,
      home: const AuthorizationScreen(),
    );
  }
}
