import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

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
      validator: validateEmail,
      onSaved: ((newValue) {
        email = newValue!;
      }),
    );
  }

  Widget passwordField() {
    return TextFormField(
      // obscureText: true,
      decoration: InputDecoration(
        label: Text('Password'),
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: ((newValue) {
        password = newValue!;
      }),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print('$email, $password');
        }
      },
      child: Text('Submit'),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
      ),
    );
  }
}
