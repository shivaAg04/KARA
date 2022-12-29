import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_app/screen/games/findWithAlphabet/mcqGame.dart';
import 'package:speech_app/screen/user/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const ProfileScreen();
                }),
              );
            }),
            child: Image.asset(
              "assets/images/profile.png",
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/bghome.png",
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
              height: (MediaQuery.of(context).size.height),
              width: (MediaQuery.of(context).size.width),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Lottie.asset(
                          fit: BoxFit.cover,
                          "assets/lottie/boy.json",
                        ),
                      ),
                      Text(
                        "HEY ! \n      Shiva",
                        style: GoogleFonts.acme(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Card(
                              color: Color.fromARGB(255, 4, 140, 163),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 4,
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/crazyy.png",
                                      filterQuality: FilterQuality.high),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "   Crazy Alphabet    ",
                                      style: GoogleFonts.abhayaLibre(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => McqGame(),
                                ),
                              );
                            },
                            child: Card(
                              color: Color.fromARGB(255, 4, 140, 163),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 4,
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/mcqGame.png",
                                      filterQuality: FilterQuality.high),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "Find with Alphabet",
                                      style: GoogleFonts.abhayaLibre(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              color: Color.fromARGB(255, 4, 140, 163),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 4,
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/pretty.png",
                                      filterQuality: FilterQuality.high),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      " Pretty Mushroom  ",
                                      style: GoogleFonts.abhayaLibre(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // name change

                          InkWell(
                            onTap: () {},
                            child: Card(
                              color: Color.fromARGB(255, 4, 140, 163),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 4,
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/bodyy.png",
                                      filterQuality: FilterQuality.high),
                                  Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      " Boy in Metaverse  ",
                                      style: GoogleFonts.abhayaLibre(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
