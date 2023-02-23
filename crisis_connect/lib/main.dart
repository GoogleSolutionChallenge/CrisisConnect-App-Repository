import 'package:flutter/material.dart';
import './screens/HomeScreen.dart';
import './screens/CreateProfileScreen.dart';


void main() => runApp(const CrisisConnect());

class CrisisConnect extends StatelessWidget {
  const CrisisConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: FormScreen(),
          ),
        ),
      ),
    );
  }
}

