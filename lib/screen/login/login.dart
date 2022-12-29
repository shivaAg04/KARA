import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'package:kiet_olx/screens/User/sign_in.dart';
// import 'package:kiet_olx/screens/User/sign_up.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_app/screen/login/main_user_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isloggedin = false;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const MainUserScreen();
          }),
        );
      }
    });
  }

  googleLogin() async {
    print("googleLogin method Called");

    try {
      var googleAc = await _googleSignIn.signIn();
      if (googleAc == null) {
        return;
      }

      final userData = await googleAc.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      checkAuthentification();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/images/bgImage.png",
          height: (MediaQuery.of(context).size.height),
          width: (MediaQuery.of(context).size.width),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 190, 20, 30),
          child: Lottie.asset('assets/lottie/panda.json'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(70, 190, 40, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'KARA',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green))
                    ]),
              ),
              const SizedBox(height: 10.0),
              const Text(
                textAlign: TextAlign.center,
                'Kids Augmented Reality App',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 30.0),
              SignInButton(
                  elevation: 10,
                  Buttons.Google,
                  text: "Sign up with E-MAIL ID",
                  onPressed: googleLogin)
            ],
          ),
        ),
      ],
    ));
  }
}
