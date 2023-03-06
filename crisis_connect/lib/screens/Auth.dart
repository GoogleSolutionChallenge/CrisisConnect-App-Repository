import 'package:crisis_connect/screens/LogInScreen.dart';
import 'package:crisis_connect/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _AuthState();
}

class _AuthState extends State<Auth>{
  bool showLogInScreen = true;

  void toggleScreens() {
    setState(() {
      showLogInScreen = !showLogInScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogInScreen) {
      return LogInScreen(showSignUpScreen: toggleScreens);
    } else {
      return SignUpScreen(showLogInScreen: toggleScreens);
    }
  }

}