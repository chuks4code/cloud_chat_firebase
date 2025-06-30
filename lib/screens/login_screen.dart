import 'package:cloud_chat_firebase/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../authentificationn.dart';
import '../constant.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/loginScrn';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPinner = false;
  String emailEnteredLogin = '';
  String passwordEnteredLogin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showPinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo1',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(height: 48.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  emailEnteredLogin = value;
                },
                decoration: textFieldInput.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  passwordEnteredLogin = value;
                },
                decoration: textFieldInput.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(height: 24.0),
              roundButton(
                colourr: Colors.lightBlueAccent,
                title: 'Log in',
                onpress: () async {
                  setState(() {
                    showPinner = true;
                  });
                  AuthClass authClas = AuthClass(
                    emaill: emailEnteredLogin,
                    passwordd: passwordEnteredLogin,
                  );
                  authClas.registerUser(context);
                  authClas.loginUser(context);
                  setState(() {
                    showPinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
