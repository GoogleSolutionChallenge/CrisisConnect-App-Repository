import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import './screens/HomeScreen.dart';
import './screens/CreateProfileScreen.dart';
import './screens/EditProfileScreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  getVisitedCountries() async {
    // Get data from docs and convert map to List
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('test')
        .get();
    final val = querySnapshot.docs.map((doc) => doc.data());
    print(val);
  }
  getVisitedCountries();

  print('hello');
  runApp(const CrisisConnect());

}
// void main() => runApp(const CrisisConnect());

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

