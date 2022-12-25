import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:speech_app/screen/home/home_screen.dart';
import 'package:speech_app/screen/login/login.dart';
import 'package:speech_app/screen/login/main_user_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    //set time to load the new page

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return MainUserScreen();
        }),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bgImage.png",
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
            fit: BoxFit.cover,
          ),
          Container(
              alignment: Alignment.center,
              child: Lottie.asset('assets/lottie/panda.json')),
        ],
      ),
    );
  }
}
