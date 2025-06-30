import 'package:cloud_chat_firebase/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcomeScrn';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo1',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(height: 48.0),
            roundButton(
              colourr: Colors.lightBlue,
              title: 'Log in',
              onpress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            roundButton(
              colourr: Colors.blue,
              title: 'Register',
              onpress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
