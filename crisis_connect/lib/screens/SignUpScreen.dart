import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback showLogInScreen;
  const SignUpScreen({Key? key, required this.showLogInScreen})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // dispose controllers for memory management
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  bool passwordConfirmed() {
    return _confirmPasswordController.text.trim() == _passwordController.text.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Hello there
                const Text(
                  'Hello there',
                  style: TextStyle(fontSize: 52),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                const Text('Register below with your details',
                    style: TextStyle(
                      fontSize: 18,
                    )),

                const SizedBox(height: 40),

                // email
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white10),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email'),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                // password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white10),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password'),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                // confirm password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white10),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm your password'),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // sign-in button
                Container(
                  height: 45,
                  margin: const EdgeInsets.all(40),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {signUp;},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent, // Text Color
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                // not a member? register now
                Row(
                  children: <Widget>[
                    const Text('Already have an account?'),
                    GestureDetector(
                      onTap: widget.showLogInScreen,
                      child: const Text('Log In',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
