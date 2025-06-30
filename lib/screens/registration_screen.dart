import 'package:cloud_chat_firebase/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../authentificationn.dart';
import '../constant.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '/registratinScrn';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showPinner = false;
  String emailEntered = '';
  String passwordEntered = '';
  late UserCredential newUser;
  // AuthClass auth = AuthClass(emaill: '', passwordd: '');

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
                  emailEntered = value;
                },
                decoration: textFieldInput.copyWith(
                  hintText: 'Enter your email ',
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  passwordEntered = value;
                },
                decoration: textFieldInput.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(height: 24.0),
              roundButton(
                colourr: Colors.blueAccent,
                title: 'Register',
                onpress: () {
                  setState(() {
                    showPinner = true;
                  });
                  AuthClass authRegis = AuthClass(
                    emaill: emailEntered,
                    passwordd: passwordEntered,
                  );
                  authRegis.registerUser(context);
                  authRegis.loginUser(context);
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
