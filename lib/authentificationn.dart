import 'package:cloud_chat_firebase/screens/chat_screen.dart';
import 'package:cloud_chat_firebase/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthClass({required this.emaill, required this.passwordd});
  String emaill;
  String passwordd;

  // Function to register a new user
  Future<void> registerUser(BuildContext context) async {
    try {
      // Try creating user with entered email and password

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: emaill, password: passwordd);
      // Check if user's email is verified, if not, send verification email
      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
      }

      // Show a message telling user to check their email for verification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Verification email sent. Please check your inbox.'),
        ),
      );

      Navigator.pushReplacementNamed(context, LoginScreen.id);
    } catch (e) {
      // If error occurs, print it to console
      print(e);
    }
  }

  // Function to login existing user
  Future<void> loginUser(BuildContext context) async {
    try {
      // Try signing in with entered email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emaill,
        password: passwordd,
      );

      // Check if user is not null and their email is verified
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        // If verified, navigate to '/chat' screen replacing current screen
        Navigator.pushReplacementNamed(context, ChatScreen.id);
      } else {
        // If not verified, show a message and send another verification email
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please verify your email before login.')),
        );
        await userCredential.user!.sendEmailVerification();
      }
    } catch (e) {
      // If error occurs during login, print it
      print(e);
    }
  }
}
