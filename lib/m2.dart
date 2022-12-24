import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class m2 extends StatefulWidget {
  const m2({super.key});

  @override
  State<m2> createState() => _m2State();
}

class _m2State extends State<m2> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/animal.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.red,
        child: ClipRRect(child: Image.asset("assets/next.png")),
        onPressed: () {},
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          // bg(context),
          Image.asset(
            alignment: Alignment.topCenter,
            "assets/B.gif",
            height: 125.0,
            width: 125.0,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/point.png"),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      AudioPlayer().play(AssetSource("audio/wrong.mp3"));
                      wrongDialog(context, "Cow");
                    },
                    child: Image.asset(
                      "assets/images/cow.png",
                      height: 125.0,
                      width: 125.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      AudioPlayer().play(AssetSource("audio/correct.mp3"));

                      rightDialog(context, "Buffalo ");
                    },
                    child: Image.asset(
                      "assets/images/buffalow.png",
                      height: 125.0,
                      width: 125.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      AudioPlayer().play(AssetSource("audio/wrong.mp3"));
                      wrongDialog(context, "Camel");
                    },
                    child: Image.asset(
                      "assets/images/camel.png",
                      height: 125.0,
                      width: 125.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> wrongDialog(BuildContext context, String name) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 183, 255, 185),
        title: const Text(
          "Wrong Answer",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        content: Text("No this is $name"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              child: const Text("okay", style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> rightDialog(BuildContext context, String name) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Color.fromARGB(255, 183, 255, 185),
        title: const Text(
          "Hurray Right Answer",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        content: Text("This is $name"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              child: const Text("okay", style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }

  Container bg(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // Below is the code for Linear Gradient.
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Color.fromARGB(255, 0, 255, 247)],
          begin: Alignment.center,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
