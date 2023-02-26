import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('signed in as ${user.email}'),
            Container(
              height: 45,
              margin: const EdgeInsets.all(40),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red, // Text Color
                ),
                child: const Text("sign out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
