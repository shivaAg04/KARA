import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speech_app/screen/login/main_user_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("object");
          await GoogleSignIn().disconnect();
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainUserScreen(),
            ),
          );
        },
        child: Image.asset("assets/images/logout.png"),
      ),
      body: Image.asset(
        "assets/images/profilepage.png",
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
      ),
    );
  }
}
