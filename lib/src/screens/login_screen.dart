import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(
              margin: EdgeInsets.only(top: 10),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        label: Text('Email address'),
        hintText: 'youremail@example.com',
      ),
      validator: (String? value) {
        if (!value!.contains('@')) {
          return 'Please enter a valid email';
        }
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      // obscureText: true,
      decoration: InputDecoration(
        label: Text('Password'),
        hintText: 'Password',
      ),
      validator: (String? value) {
        if (value!.length < 4) {
          return 'Password must be at least 4 chars';
        }
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        formKey.currentState?.validate();
      },
      child: Text('Submit'),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
      ),
    );
  }
}
