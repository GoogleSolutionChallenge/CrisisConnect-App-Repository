import 'package:crisis_connect/screens/OnBoardingScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CrisisConnect());

class CrisisConnect extends StatelessWidget {
  const CrisisConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const Scaffold(
        body: SafeArea(
          child: OnBoardingScreen(),
        ),
      ),
    );
  }
}