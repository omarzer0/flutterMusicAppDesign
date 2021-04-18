import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var imageNumber = 1;
  var colorsList = [Colors.black, Colors.deepPurple, Colors.blue[900]];
  var colorsListBg = [Colors.black12, Color(0xC7D3D4FF), Color(0x9CC3D5FF)];
  var player = AssetsAudioPlayer();
  var isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: colorsListBg[imageNumber - 1],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'images/image$imageNumber.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 32, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.repeat,
                      size: 24, color: colorsList[imageNumber - 1]),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        imageNumber--;
                        if (imageNumber == 0) imageNumber = 3;
                        player.open(Audio('assets/ost$imageNumber.mp3'),
                            autoStart: isPlaying);
                      });
                    },
                    icon: Icon(Icons.skip_previous,
                        size: 24, color: colorsList[imageNumber - 1]),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                        if (isPlaying)
                          player.play();
                        else
                          player.pause();
                      });
                    },
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.play_circle_fill,
                      size: 48,
                      color: colorsList[imageNumber - 1],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        imageNumber++;
                        if (imageNumber == 4) imageNumber = 1;
                        player.open(Audio('assets/ost$imageNumber.mp3'),
                            autoStart: isPlaying);
                      });
                    },
                    icon: Icon(Icons.skip_next,
                        size: 24, color: colorsList[imageNumber - 1]),
                  ),
                  Icon(Icons.shuffle,
                      size: 24, color: colorsList[imageNumber - 1]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
