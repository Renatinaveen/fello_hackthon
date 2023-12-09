import 'package:fello_hackthon/resources/color_themes.dart';
import 'package:fello_hackthon/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FelloHackathonApp());
}

class FelloHackathonApp extends StatelessWidget {
  const FelloHackathonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fello Hackathon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorThemes.purple),
          useMaterial3: true,
          fontFamily: 'Rajdhani'),
      home: const SplashPage(),
    );
  }
}
