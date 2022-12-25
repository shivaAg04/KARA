import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:speech_app/screen/home/home_screen.dart';
import 'package:speech_app/screen/login/login.dart';

class MainUserScreen extends StatefulWidget {
  const MainUserScreen({Key? key}) : super(key: key);

  @override
  State<MainUserScreen> createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<MainUserScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isloggedin = false;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      print(user!.email);
      if (user != null) {
        setState(() {
          isloggedin = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    checkAuthentification();
  }

  @override
  Widget build(BuildContext context) {
    return isloggedin ? const HomeScreen() : LoginScreen();
  }
}
