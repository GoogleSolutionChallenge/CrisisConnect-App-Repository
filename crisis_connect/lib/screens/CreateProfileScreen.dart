import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  late String _name;
  late String _email;
  late String _password;
  late String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Name can't be empty" : null;
      },
      onSaved: (String? value) {
        _name = value!;
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
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Password can't be empty" : null;
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        return value==null ||value.isEmpty ? "Phone number can't be empty" : null;
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Profile")),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                _buildPhoneNumber(),
                const SizedBox(height: 100),
                ElevatedButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState!.save();

                    if (kDebugMode) {
                      print(_name);
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