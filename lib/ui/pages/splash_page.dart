import 'package:fello_hackthon/resources/color_themes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.background,
      body: Center(
        child: Lottie.asset(
          'assets/animations/fello_save.json',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
