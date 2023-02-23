import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {

  const FormScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CreateProfile();
  }
}

class CreateProfile extends State<FormScreen> {

  bool _obscureText = true;
  late String _firstname;
  late String _lastname;
  late String _email;
  late String _password;
  late String _phoneNumber;
  var _controller = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'First Name'),
      //maxLength: 10,
      validator: (String? value) {
        return value==null ||value.isEmpty ? "First Name can't be empty" : null;
      },
      onSaved: (String? value) {
        _firstname = value!;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Last Name'),
      //maxLength: 10,
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Last Name can't be empty" : null;
      },
      onSaved: (String? value) {
        _lastname = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Email can't be empty" : null;
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              onPressed: () { _toggle(); },
              icon: Icon(Icons.remove_red_eye)),
      ),
      obscureText: _obscureText,
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Password can't be empty" : null;
      },
      onSaved: (String? value) {
        _password = value!;
      },
    );
  }

  Widget _hideShowPassword() {
    return TextButton(
        onPressed: _toggle,
        child: Text(_obscureText ? "Show" : "Hide"));
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Phone number'),
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Phone number can't be empty" : null;
      },
      onSaved: (String? value) {
        _phoneNumber = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildFirstName(),
                _buildLastName(),
                _buildEmail(),
                _buildPassword(),
                _buildPhoneNumber(),
                SizedBox(height: 100),
                ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();

                    if (kDebugMode) {
                      print(_firstname);
                    }
                    if (kDebugMode) {
                      print(_lastname);
                    }
                    if (kDebugMode) {
                      print(_email);
                    }
                    if (kDebugMode) {
                      print(_phoneNumber);
                    }
                    if (kDebugMode) {
                      print(_password);
                    }
                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}