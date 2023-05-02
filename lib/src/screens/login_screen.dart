import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40.0,
        bottom: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
            ),
            submitButtom(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      // obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: validatePassword,
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

  Widget submitButtom() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          print('Email :$email and Password :$password');
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: const Text('Submit'),
    );
  }
}
