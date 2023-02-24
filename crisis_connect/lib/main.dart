
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/HomeScreen.dart';
import './screens/CreateProfileScreen.dart';
import './screens/EditProfileScreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CrisisConnect());

}

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

